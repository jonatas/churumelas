require "sandbox"
Challenges = [ ]
def challenge opts
  challenge = Class.new
  opts[:level] = Challenges.size + 1
  opts.each do |opt, with_value|
    challenge.define_singleton_method opt, lambda { with_value }
  end
  challenge.define_singleton_method :to_s, lambda { [self.level,self.title].join(" - ") }

  if not challenge.code_challenge.include? GameChallenge::COMMENT
    puts "You forgot to put #{ GameChallenge::COMMENT} in the code"
    puts __FILE__
    puts challenge.code_challenge
    raise 'wtf!'
  end
  compiled_valid_code = challenge.code_challenge.gsub(GameChallenge::COMMENT, challenge.valid_answer)
  Sandbox.new.eval compiled_valid_code
  Challenges << challenge
end
Challenges.class_eval do
  def get_level level
    find {|challenge|challenge.level == level} or
    raise "There's no level #{level} on #{Challenges.collect(&:level).inspect}"
  end
end

GameChallenge::COMMENT = "# Your code here"

challenges = %w(
  start
  split_my_email
  set_your_username
  do_you_wanna_continue
  cog_job_is_for_you
  cog_job_face_builder_starting_for_fun
  cog_job_face_builder_with_noose
  cog_job_recognize_different_smiles
  cog_job_recognize_different_smiles_and_eyes
  cog_job_recognize_smiles_in_reverse_mode
  define_singleton_methods
  metaprogramming_crazy_methods
  metaprogramming_crazy_things
  metaprogramming_crazy_variables
  print_multiple_of_n
)
challenges.each do |challenge|
  require challenge
end
