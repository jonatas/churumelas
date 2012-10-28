challenge :title  =>  %q{Face.new.happy == ":)"},
  :description => %q{Your online challenge is getting hard, and now it's time to put your imagination in the edge. Let's build the inverse process generating cool asc faces from our on code.},
  :code_challenge => %q{
class Face < String
  def happy
    # your code here
  end
end
happy = Face.new.happy
if not happy == ":)"
  raise "looks like you are not #{happy} like me :)"
end
},
  :code_help => %q{Imagine you are getting rich working at ASCOG Inc., in love with expressive code, you need to improve yourself trying to create these normalized way to talk about faces in the code. Remember each piece of your face should be part of these beautiful composition. To return the own composition you can use self to refer to the own face},
  :tags =>  "ruby ascog",
  :image_url =>  "feliz.png",
  :background_image_url =>  "fourth-background.png"
