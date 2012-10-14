class Game < ActiveRecord::Base
  attr_accessible :username, :current_level
  has_many :game_challenges 
  def start!
    self.current_level = 1
    puts "current_challenge"
    start_this! current_challenge
  end
  def next_challenge
    Challenges[current_level + 1]
  end
  def current_challenge
    if not Challenges[current_level] 
    else
      Challenges[current_level] 
    end
  end
  def next_challenge!
    start! and return if game_challenges.empty?
    if not start_this! next_challenge
      puts "You finish!"
    end
  end
  def current_challenge
    game_challenges.last.challenge if game_challenges.last
  end
  private
  def start_this! challenge
    return if not challenge
    start_it = GameChallenge.new
    start_it.level = challenge.level
    start_it.started_at = Time.now
    self.current_level = start_it.level
    self.game_challenges << start_it
    start_it
  end
end
