if not defined? Challenges
  require File.join(Rails.root,"app","challenges","all")
  puts "#{Challenges.size} challenges loaded!"
end
class Game < ActiveRecord::Base
  attr_accessible :username, :current_level
  has_many :game_challenges
  attr_reader :current_game_challenge
  def start!
    self.current_level = 1
    start_this! current_challenge
  end
  def ends?
    Challenges.last.level == current_level
  end
  def current_challenge
    Challenges.get_level current_level
  end
  def get_level! level
    self.current_level = level
    self.save
    start_this! current_challenge
  end
  def score
    game_challenges.sum &:score
  end
  def to_s
    "<Game id: #{id}, level: #{self.current_level}, score: #{self.score} >"
  end
  private
  def start_this! challenge
    self.game_challenges.find_or_create_by_level(challenge.level)
  end

end
