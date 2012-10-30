challenge :title => %q{":)".happy? # => return true},
  :description => %q{It's time to enjoy building awesome regular expressions!!},
  :code_challenge => %q{
String.class_eval do
  def happy?
    # your code here
  end
end
raise "Your first cog fail!" if not ":)".happy?
raise ":] recognizer fail" if not ":]".happy?
raise ":~( recognizer got sad faces incorrectl" if ":~(".happy?
},
  :code_help => %q{Imagine you are working on ASCOG Inc. and your next challenge is code an ASC smile recognition trying to idenfiy humam reactions in a natural language. I expect you use String#match? method.},
  :tags => "ruby regexp ascog"
  :image_url => "euforico.png",
  :valid_answer => "':)'"

