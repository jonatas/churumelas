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
GameChallenge::COMMENT = "# seu codigo aqui"
challenges = %w(
  iniciar
  zerar_terceira_coluna_da_matriz
  calcular_soma_da_terceira_coluna_da_matriz
  trocar_segunda_linha_pela_quarta
  multiplicar_pela_escalar_3
) # TODO: erase these line when it grow up to 100 challenges
challenges.each do |challenge|
  require "unisep/#{challenge}"
end
