%w(first second third).each do |challenge|
  require File.join(Rails.root,"app","challenges",challenge)
end
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
