# encoding: utf-8
challenge :title => "soma(matriz[2]) == 26",
  :description => "Agora vamos fazer a soma da terceira coluna da matriz!",
:code_challenge => %q{
matriz = [
 [3,  1,  2],
 [5,  5,  8],
 [8, 10, 11],
 [9,  1,  5]
]
def soma vetor
# seu codigo aqui
end
terceira_coluna = matriz.collect{|e|e[2]}
soma_do_vetor = soma(terceira_coluna)
if soma_do_vetor != 26
  raise "voce errou a soma #{soma_do_vetor} != 26 "
end
puts 'ok vc venceu'
},
  :valid_answer => %q{vetor.inject :+},
  :code_help => "Você pode inicializar a variável e iterar o vetor com o método each, mas também pode simplesmente usar o método inject do jeitinho certo ;)",
 :image_url => "euforico.png"

