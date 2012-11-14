# encoding: utf-8
challenge :title => "linha[2] == 0",
  :description => "Vamos começar o trabalho com matrizes.  alterar a matriz deixando a terceira coluna zerada! vamos ver se você aprendeu a lição!",
:code_challenge => %q{
matriz = [
 [3,  1,  2],
 [5,  5,  8],
 [8, 10, 11],
 [9,  1,  5]
]
# seu codigo aqui
matriz.each do |linha|
  raise 'voce errou!' if not linha[2] == 0
end},
  :valid_answer => %q{matriz.each {|l|l[2] = 0}},
  :code_help => "Você precisa lembrar que uma matriz inicia com o índice em zero, então, logo a terceira coluna é 2. Tente iterar a matriz com o método each.",
  :image_url => "euforico.png"
