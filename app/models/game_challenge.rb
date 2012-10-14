class GameChallenge < ActiveRecord::Base
  belongs_to :game
  delegate :correct_answer, :code_challenge, :to => :challenge
  attr_accessible :pass_level_at, :start_typing_at, :started_at, :submit_first_time_at
  attr_accessible :tries_before_sucess, :last_compiling_error, :last_compiling_error_trace, :last_answer, :level
  attr_accessor :compiled_challenge
  def challenge
    Challenges[self.level]
  end
  def pass_with! answer 
    self.submit_first_time_at ||= Time.now
    if (can_pass = self.valid_answer?(answer))
      self.pass_level_at = Time.now
    end
    self.save if changed?
    return can_pass
  end

  def valid_answer? answer
    self.tries_before_sucess += 1
    self.last_answer = answer
    self.compiled_challenge = code_challenge.gsub('# your code here', answer)
    # your code here
    logger.info "Evaluating... with #{answer}"
    logger.info self.compiled_challenge
    begin
      eval self.compiled_challenge
    rescue  Exception => e
      register_error e
      return false
    end
    return true 
  end
  def read_question_time
    start_typing_at - started_at if start_typing_at
  end
  def write_answer_time
   pass_level_at - started_at  if pass_level_at
  end
  def score
    #puts "return 0 if not #{last_answer.nil?} or not #{pass_level_at.nil?} or not #{start_typing_at.nil?}"
    return 0 if not self.last_answer or not pass_level_at or not start_typing_at
    ( 
     (challenge.description.to_s.size + correct_answer.to_s.size + last_answer.to_s.size) /
         (read_question_time * write_answer_time)  /
             tries_before_sucess
    ).to_i.abs
  end
  private
  def register_error e
    self.last_compiling_error, 
      self.last_compiling_error_trace = e.message, e.backtrace.inspect 

    logger.warn "ops! #{e.message} on challenge ##{self.id}"
  end
end
