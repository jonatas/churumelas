challenge :title => "Kernel.remix! # \o/",
  :description => "Hey! now it's time to block all the methods on your class to avoid it to be override.",
  :code_challenge => %q{
class YouCantDoIt < RuntimeError; end
class StringNumbers
  def one ; 'one' end
  def two ; 'two' end
  def self.method_added method_name
    # your code here
    raise YouCantDoIt.new "#{method_name} was rejected!"
  end
end
class ALotOfStringNumbers < StringNumbers
  def three; 'three' end rescue YouCantDoIt
end
num = ALotOfStringNumbers.new
raise "ops! '#{num.one}' != 'one'?" if not num.one == 'one'
raise "ops! '#{num.two}' != 'two'?" if not num.two == 'two'
raise "ops! method added!" if num.respond_to? :three
},
:code_help => %{The objective here is just remove the code after the implementation. Basically you need to undefine the method. There's a great helpful method named undef_... that can help you!},
:valid_answer => "undef_method method_name",
:image_url => "feliz.png"
