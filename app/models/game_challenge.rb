class GameChallenge < ActiveRecord::Base
  belongs_to :game
  delegate :correct_answer, :code_challenge, :to => :challenge
  attr_accessible :pass_level_at, :start_typing_at, :started_at, :submit_first_time_at
  attr_accessible :tries_before_sucess, :last_compiling_error, :last_compiling_error_trace, :last_answer, :level, :score
  before_save :compute_score
  attr_accessor :compiled_challenge, :thread_return
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
    return valuate_code_safe(answer)
  end
  def read_question_time
    start_typing_at - started_at if start_typing_at
  end
  def write_answer_time
   pass_level_at - started_at  if pass_level_at
  end
  def compute_score
    #puts "return 0 if not #{last_answer.nil?} or not #{pass_level_at.nil?} or not #{start_typing_at.nil?}"
    if not self.last_answer or not pass_level_at or not start_typing_at
      return self.score = 0
    end
    return self.score = 
    ( 
     (challenge.description.to_s.size +
             correct_answer.to_s.size + 
                last_answer.to_s.size
     ) /
     (read_question_time * write_answer_time)  /
            tries_before_sucess
    ).to_i.abs
  end
  protected
  def valuate_code_safe answer
    self.last_answer = answer
    self.compiled_challenge = code_challenge.gsub('# your code here', answer)
    # your code here
    logger.info "Evaluating... with #{answer}"
    logger.info self.compiled_challenge
    begin
      eval self.compiled_challenge
      self.thread_return = true
      return true
    rescue  Exception => e
      self.register_error e
      self.thread_return = true
    end
    return false
  end
  def register_error e
    self.last_compiling_error, 
      self.last_compiling_error_trace = e.message, e.backtrace.inspect 

    logger.warn "ops! #{e.message} on challenge ##{self.id}"
  end
end
