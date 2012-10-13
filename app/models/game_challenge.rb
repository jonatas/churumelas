class GameChallenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :challenge
  attr_accessible :pass_level_at, :start_typing_at, :started_at, :submit_first_time_at, :user_answer
end
