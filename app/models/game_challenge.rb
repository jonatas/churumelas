class GameChallenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :challenge
  delegate :correct_answer, :code_challenge, :to => :challenge
  attr_accessible :pass_level_at, :start_typing_at, :started_at, :submit_first_time_at
  attr_accessible :tries_before_sucess, :last_compiling_error, :last_compiling_error_trace 

  def pass_with! answer 
    if not self.submit_first_time_at 
      self.submit_first_time_at = Time.now
    end
    can_pass = self.valid_answer? answer
    if can_pass
      self.pass_level_at = Time.now
    end
    self.save if changed?
    return false if not can_pass
    return true
  end

  def valid_answer? answer
    if correct_answer.is_a? String 
      logger.info "valid_answer? #{correct_answer.inspect} == #{answer.inspect}"
      return correct_answer == answer
    end
    @compiled_challenge = code_challenge.gsub('# your code here', answer)
    # your code here
    logger.info "Evaluating... with #{answer}"
    logger.info @compiled_challenge
    begin
      eval @compiled_challenge
    rescue  Exception => e
      register_error e
      return false
    end
    return true 
  end
  private
  def register_error e
    self.tries_before_sucess += 1
    self.last_compiling_error, 
      self.last_compiling_error_trace = e.message, e.backtrace.inspect 

    logger.warn "ops! #{e.message} on challenge ##{self.id}"
  end
end
