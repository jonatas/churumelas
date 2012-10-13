class Challenge < ActiveRecord::Base
  attr_accessible :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title, :compiled_challenge, :last_compiling_error, :last_compiling_error_trace, :tries_before_sucess
  serialize :correct_answer
  belongs_to :game

  def next_challenge
    Challenge.where("id > ?", id).order("id asc").limit(1).first
  end
end

