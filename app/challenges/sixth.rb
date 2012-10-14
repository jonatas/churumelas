class Sixth
  class << self
    def level; 6; end
    def title 
      %q{"@game.username != "anonymous"}
    end
    def description
      %q{Try to put your name in your @game!}
    end
    def code_challenge
      %q{# your code here
if @username == "not defined"
  raise "Let's go! put your name!"
end}
    end
    def code_help 
      %q{Your code will be replaced on "# your code here" tag. Now put your name on the variable username to see your the score!}
    end
    def tags ; "ruby beginner" end
    def image_url ; "bird.png" end
    def background_image_url ; "start-background.png" end
  end
end
