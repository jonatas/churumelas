
require "app/challenges/first"
require "app/challenges/second"
require "app/challenges/third"
Challenges = [
  First,
  Second,
  Third
]
Challenges.class_eval do
  def [] level
      find {|challenge|challenge.level == level} or raise "Nao encontrou #{current_level} em #{Challenges.collect(&:level).inspect }"
  end
end
