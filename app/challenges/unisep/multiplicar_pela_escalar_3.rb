# encoding: utf-8
challenge :title => "[[2,3]].multiplicar_pelo_escalar(2) == [[4,6]]",
  :description => "Agora vamos fazer multiplicação da matriz por um determinado escalar.",
:code_challenge => %q{
class Array
  def multiplicar_pelo_escalar valor
    # seu codigo aqui
  end
end
matriz   = [ [3,  1,  2], [5,   5,  8], [ 8, 10, 11], [ 9,  1,  5] ]
esperado = [ [9,  3,  6], [15, 15, 24], [24, 30, 33], [27,  3, 15] ]
resultado = matriz.multiplicar_pelo_escalar(3)

if resultado != esperado
  raise "Opa! resultado #{resultado.inspect} nao foi como #{esperado.inspect}"
end
if [[2,3]].multiplicar_pelo_escalar(2) != [[4,6]]
  raise "Ainda tem algum problema..."
end
},
  :code_help => "Este desafio vai exigir que você trabalhe com a matriz em dois níveis então terá que usar o collect 2 vezes, tanto para linhas quanto para colunas. Lembre-se [1,2].collect{|e|e+1} == [2,3]",
 :image_url => "desanimado.png",
 :valid_answer => "self.collect {|linha| linha.collect {|coluna| coluna * valor } }"
