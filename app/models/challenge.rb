class Challenge < ActiveRecord::Base
  attr_accessible :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title
  serialize :correct_answer
  def next_challenge
    Challenge.where("id > ?", id).order("id asc").limit(1).first
  end
  def valid_answer? answer
    if correct_answer.is_a? String 
      puts "valid_answer? #{correct_answer.inspect} == #{answer.inspect}"
      return true if correct_answer == answer
    end
    if correct_answer.is_a? Regexp 
      matches = correct_answer.match(answer)
      puts "valid_answer? #{answer.inspect}.match?(#{correct_answer.inspect}) # => #{matches.inspect}"
      eval code_challenge.gsub('# your code here', answer)
      return true if matches 
    end
    return false
  end
end

