class Challenge < ActiveRecord::Base
  attr_accessible :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title, :compiled_challenge, :last_compiling_error, :last_compiling_error_trace, :tries_before_sucess
  serialize :correct_answer
  belongs_to :game

  def next_challenge
    Challenge.where("id > ?", id).order("id asc").limit(1).first
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
    rescue SyntaxError => s
      register_error s
      return false
    rescue  RuntimeError => r
      register_error r
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

