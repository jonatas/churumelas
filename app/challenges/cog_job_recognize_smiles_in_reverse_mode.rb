challenge :title  =>  %q{"8-0".scared?},
  :description =>  %q{Now let's trying to get it in the final regexp contest. Building multiple groups with expressions in the same expression. You can use `/?'mouth'\)\|\\\|` and other groups to mouth and noose. Your main objective is allow smile in other sense},
  :code_challenge => %q{
String.class_eval do
  def happy?
    # your code here
  end
end
["(=","8)","(:","#)", "[-8"].each do |smile|
  if not smile.happy?
    raise "the #{smile} was not recognized"
  end
end},
  :code_help =>  %q{Imagine the ASCOG Inc. is loving your work! Now, it can support inversed faces and you can compose groups to reuse them while trying to find noose and eyes. Remember the mouth happy combines the side of eyes...},
  :tags =>  "ruby regexp ascog",
  :image_url =>  "crazy.png",
  :background_image_url =>  "fifth-background.png"
