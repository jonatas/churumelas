class Game < ActiveRecord::Base
  attr_accessible :username
  has_many :game_challenges 
  def start!
    start_it = GameChallenge.new
    start_it.challenge = Challenge.first
    self.game_challenges << start_it
  end
end
