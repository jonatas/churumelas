challenge :title  =>  %q{Face.new.with_eyes.with_noose.and_happy == ":-)"},
  :description => %q{Your online challenge is getting hard, and now it's time to put your imagination in the edge. Let's build the inverse process generating cool asc faces from our on code.},
  :code_challenge => %q{
class Face < String
  USES = { :eyes  => ":",
           :noose => "-",
           :smile => ")",
           :scare => "("  }
  def method_missing name, *args, &block
    # your code here
    return super
  end
end
if not ( happy = Face.new.with_eyes.and_noose.and_smile ) == ":-)"
  raise "looks like you are not #{happy.inspect} like me :-)"
end
if not (scare = Face.new.with_eyes.and_scare)  == ":("
  raise "Are you scared? #{scare.inspect}"
end
},
  :code_help => %q{Imagine you are in love with expressive code, and now it's time to improve the Face class trying to create these normalized way to talk about faces in the code. Remember each piece of your face should be part of these beautiful composition. To return the own composition you can use self to refer to the own face},
 :valid_answer => %q{return self << USES[$2.to_sym] if name =~ /^(with|and)_(.*)/},
  :tags =>  "ruby ascog",
  :image_url =>  "decepcionado.png"
