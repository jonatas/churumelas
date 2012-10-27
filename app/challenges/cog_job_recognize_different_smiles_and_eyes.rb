challenge :title  =>  %q{"8-)".happy? => true},
  :description => %q{I imagine you're getting fun with these challenge. And now it's time to add other kind's of eyes to our recognizer},
  :code_challenge => %q{
String.class_eval do
  def happy?
    # your code here
  end
end
["=]","8)",":-)","#)"].each do |smile|
  if not smile.happy?
    raise "the #{smile} was not recognized"
  end
end},
  :code_help =>%q{Imagine the ASCOG Inc. is loving your work! Now, the support bring some new eyes that need to be recognized by or own method. Rebember, to use groups like: `/\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")`},
  :tags =>  "ruby regexp ascog",
  :image_url =>  "amigo-esperando.png",
  :background_image_url =>  "fourth-background.png"
