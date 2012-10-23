class Seventh
  class << self
    def level; 7; end
    def title 
      "@you.can_continue? # => return true"
    end
    def description
      %q{Show me that you can continue! Declare that you can continue on the following code:}
    end
    def code_challenge
      %q{
i_wanna = Struct.new(:continue).new(false)
# your code here
raise "Come! continue! set i.continue to true'!" if not i_wanna.continue
raise "Come! set it to true" if not i_wanna.continue == true
      }
    end
    def valid_answers
      [%{i_wanna.continue = true}]
    end
    def invalid_answers
      %w(staort STRAT estart false)
    end
    def code_help 
      %q{Your code will be replaced on "# your code here" tag. Now proceed attributing the continue value to i_wanna local variable}
    end
    def tags ; "ruby beginner" end
    def image_url ; "feliz.png" end
    def background_image_url ; "start-background.png" end
  end
end
