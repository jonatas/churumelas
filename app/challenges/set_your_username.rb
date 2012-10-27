challenge :title  =>  %q{"@game.username != "anonymous"},
  :description  =>  %q{Try to put your name in your @game!},
  :code_challenge => %q{
# your code here
if @username == "not defined"
  raise "Let's go! put your name!"
end},
  :code_help  =>  %q{Your code will be replaced on "# your code here" tag. Now put your name on the variable username to see your the score!},
  :tags  =>  "ruby beginner",
  :image_url  =>  "bird.png",
  :background_image_url  =>  "start-background.png"
