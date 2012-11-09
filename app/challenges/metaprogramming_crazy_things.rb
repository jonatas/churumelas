challenge :title => "Metaprogramming.start!",
  :description => "It's time to show me your skill's on metaprogramming cool features in ruby. Let's try to get the java man that exists into yourself trying to reproduce a final class throwing an exception when it was inherited from final classes.",
  :code_challenge => %q{
class YouCantDoIt < RuntimeError; end
class OpenedForever
  # your code here
    raise YouCantDoIt.new "#{self} can't be #{subclass}"
  end
end
begin
  class Closed < OpenedForever
  end
  raise "your implementation fail! it shouldn't work"
rescue YouCantDoIt
  puts "Great!"
end},
:code_help => %{imagine you want to guarantee there's no classes extending your final class. Now it's time to practice. On the ruby hook methods, you can get a great help with inherited method. It receives the subclass as the unique parameter. Take a look at this if you get confused: http://khelll.com/blog/ruby/ruby-callbacks/},
:valid_answer => "def self.inherited(subclass)",
:image_url => "feliz.png"
