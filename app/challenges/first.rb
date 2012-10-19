class First
  class << self
    def level; 1; end
    def title 
      "@you.can_start? # => return true"
    end
    def description
      %q{Show me the world! Type "start" to face your first challenge!}
    end
    def code_challenge
      %q{
console_input = "# your code here"
if console_input !~ /start/i
  raise "Come on! Type 'start'!"
end
      }
    end
    def valid_answers
      %w(start Start START)
    end
    def invalid_answers
      %w(staort STRAT estart)
    end
    def code_help 
      %q{Your code will be replaced on "# your code here" tag. Now proceed typing start}
    end
    def tags ; "ruby beginner" end
    def image_url ; "feliz.png" end
    def background_image_url ; "start-background.png" end
  end
end
