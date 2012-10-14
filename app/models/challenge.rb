class Challenge 
  attr_accessor :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title, :compiled_challenge, :last_compiling_error, :last_compiling_error_trace, :tries_before_sucess, :correct_answer

  def next_challenge
    Challenges[Challenges.index(self) + 1]
  end
end
