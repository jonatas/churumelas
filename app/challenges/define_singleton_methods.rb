challenge :title => "Churumelas.start_hacking! # true",
  :description => "It's time to enjoy with my own challenges building Churumelas. Now let's play around build singleton methods over anonymous classes. As you know, metaprogramming in ruby turn your code in whatever you want.",
:code_challenge => %q{
Challenges = [ ]
def challenge opts
  challenge = Class.new
  opts[:level] = Challenges.size + 1
  opts.each do |opt, with_value|
    # your code here
  end
  Challenges << challenge
end
challenge :title => "@you.can_start? # => return true",
  :code_challenge => %q{
console_input = "# _your_code_here_"
if console_input !~ /start/i
  raise "Come on! Type 'start'!"
end}

if not Challenges.first.title =~ /@you\.can_star/
  raise "Ops! you forgot something!"
end
},
:code_help => "on Class there's a method define_singleton_method can help you do it. It accepts the method name and a block to method implementation. If you're afraid but curious about, please take a look at master: https://github.com/jonatas/churumelas/blob/master/app/challenges/all.rb, I really copied from it.",
:valid_answer => %q{challenge.define_singleton_method opt, lambda { with_value }},
:image_url => "logo-yellow.png"
