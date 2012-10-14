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
  def next_challenge
    Challenges[current_level + 1]
  end
  def current_challenge
    Challenges[current_level] 
  end
  def next_challenge!
    start! and return if game_challenges.empty?
    if not start_this! next_challenge
      puts "You finish!"
    end
  end
  private
  def start_this! challenge
    return if not challenge
    start_it = GameChallenge.new
    start_it.level = challenge.level
    start_it.started_at = Time.now
    self.current_level = start_it.level
    self.game_challenges << start_it
    self.save
    @current_game_challenge = start_it
  end
end
