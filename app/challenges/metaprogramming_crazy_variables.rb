challenge :title => "You.know(:local_variables) # => true",
  :description => "Hey! let's try to identify our local variables! it's easy and readeable as you can declare.",
  :code_challenge => %q{
a = 1
b = 2
raise 'you fail' if # your code here != [:a,:b]
puts "you're awesome!"
},
  :valid_answer => "local_variables",
  :code_help => "In ruby metaprogramming everything can be inspect even local variables. These method exists in the kernel, and keeps each new declared local variable. Try to find the correct method on Kernel module :)",
  :image_url => "feliz.png",
  :tags => "ruby, metaprogramming"
