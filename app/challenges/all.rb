Challenges = [ ]
def challenge opts
  challenge = Class.new
  opts[:level] ||= Challenges.size + 1
  opts.each do |opt, with_value|
    challenge.define_singleton_method opt, lambda { with_value }
  end
  Challenges << challenge
end
Challenges.class_eval do
  def [] level
      find {|challenge|challenge.level == level} or 
      raise "Nao encontrou #{level} em #{Challenges.collect(&:level).inspect }"
  end
end
%w(start
  set_your_username
  cog_job_is_for_you
  cog_job_recognize_different_smiles
  cog_job_recognize_different_smiles_and_eyes
  cog_job_recognize_smiles_in_reverse_mode
  do_you_wanna_continue).each do |challenge|

  require challenge
end
