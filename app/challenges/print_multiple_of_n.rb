challenge :title => "multiple(2) # => [2,4,6,8,10...",
  :description => "implement the method multiple that returns all the numbers multiple by the parameter until 10.",
  :code_challenge => %q{
  def multiple n
    # your code here
  end
  if multiple(1) != (1..10).to_a
    raise "doesn't work! with n = 1"
  end
  if multiple(2) != [2,4,6,8,10,12,14,16,18,20]
    raise "doesn't work with n = 2"
  end
},
  :code_help => "you need to collect from 1 to 10 each number multiplied by n.",
  :image_url => "feliz.png",
  :valid_answer => %q{(1..10).collect {|e|e * n}}
