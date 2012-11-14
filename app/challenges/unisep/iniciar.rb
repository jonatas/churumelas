# encoding: utf-8
challenge :title => "@voce.esta_pronto_para_iniciar? # => true",
  :description  =>  %q{Mostre me que sim! digite iniciar para encarar os desafios},
  :code_challenge => %q{
entrada = "# seu codigo aqui"
if entrada !~ /^iniciar$/i
  raise "Opa! digite 'iniciar'!"
end},
  :code_help =>  %q{O que você digitar vai substituir no desafio aonde estiver escrito: # seu codigo aqui},
  :tags => "ruby beginner",
  :image_url  =>  "feliz.png",
  :valid_answer =>  "iniciar"
