%w(first second third fourth).each do |challenge|
  require File.join(Rails.root,"app","challenges",challenge)
end
Challenges = [ First, Second, Third, Fourth, Fifth ]
Challenges.class_eval do
  def [] level
      find {|challenge|challenge.level == level} or raise "Nao encontrou #{level} em #{Challenges.collect(&:level).inspect }"
  end
end
