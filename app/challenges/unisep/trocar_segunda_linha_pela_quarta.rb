# encoding: utf-8
challenge :title => "[[1,2],[3,4]].trocar_linha(0, 1) == [[3,4],[1,2]]",
  :description => "Trocar a segunda linha com a quarta linha. Lembre-se linhas não são colunas :)",
  :code_challenge => %q{
class Array
  def trocar_linha qual, com_qual
    # seu codigo aqui
    self
  end
end
matriz   = [ [3,  1,  2], [5,  5,  8], [8, 10, 11], [9,  1,  5] ]
esperado = [ [3,  1,  2], [9,  1,  5], [8, 10, 11], [5,  5,  8] ]
resultado = matriz.trocar_linha(1,3)
if resultado != esperado
  raise "ops! resultado: #{resultado.inspect} nao foi como esperado: #{esperado.inspect}"
end
},
  :valid_answer => %q{self[qual],self[com_qual] = self[com_qual],self[qual]},
  :code_help => "observe, para fazer múltiplas atribuições de valores em ruby não é necessãrio variável auxiliar. No caso é permitido a seguinte expressão: 'a, b = b, a' para inversão de valores entre as variáveis.",
  :image_url => "feliz.png"
