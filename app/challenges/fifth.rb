class Fifth
  class << self
    def level; 5; end
    def title ; %q{"8-0".scared?} end
    def description
      %q{Now let's trying to get it in the final regexp contest. Building multiple groups with expressions in the same expression. You can use `/?'mouth'\)\|\\\|` and other groups to mouth and noose. Your main objective is allow smile in other sense}
    end
    def code_challenge
%q{
String.class_eval do
  def happy?
    # your code here
  end
end
["(=","8)","(:","#)", "[-8"].each do |smile|
  if not smile.happy?
    raise "the #{smile} was not recognized"
  end
end}
    end
    def code_help 
      %q{Imagine the ASCOG Inc. is loving your work! Now, it can support inversed faces and you can compose groups to reuse them while trying to find noose and eyes. Remember the mouth happy combines the side of eyes...}
    end
    def correct_answer; :compile end
    def tags; "ruby regexp ascog" end
    def image_url; "crazy.png" end
    def background_image_url; "fifth-background.png" end
  end
end
