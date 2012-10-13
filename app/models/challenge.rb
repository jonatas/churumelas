class Challenge < ActiveRecord::Base
  attr_accessible :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title, :compiled_challenge, :last_error, :last_trace
  serialize :correct_answer
  def next_challenge
    Challenge.where("id > ?", id).order("id asc").limit(1).first
  end
  def valid_answer? answer
    if correct_answer.is_a? String 
      puts "valid_answer? #{correct_answer.inspect} == #{answer.inspect}"
      return correct_answer == answer
    end
    puts "Challenge -- #{answer}"
    @compiled_challenge = code_challenge.gsub('# your code here', answer)
    # your code here
    puts "Evaluating... with #{answer}"
    puts @compiled_challenge
      begin
        eval @compiled_challenge
      rescue SyntaxError, RuntimeError
        @last_error, @last_trace = $!,$@
        raise @last_error
        return false
      end
      return true 
  end
end

