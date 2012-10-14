Dir[File.join(Rails.root,"app","challenges", "*.rb")].each do |challenge|
  challenge.gsub! '.rb',''
  next if challenge =~ /all/
    puts "Carregando #{challenge}"
  require challenge
end
Challenges = [ First, Second, Third, Fourth, Fifth, Sixth ]
Challenges.class_eval do
  def [] level
      find {|challenge|challenge.level == level} or raise "Nao encontrou #{level} em #{Challenges.collect(&:level).inspect }"
  end
end
