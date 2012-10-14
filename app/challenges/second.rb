class Second
  class << self
    def level; 2 end
    def title; %q{":)".happy? # => return true} end
    def description 
      %q{It's time to enjoy building awesome regular expressions!!}
    end
    def code_challenge 
      %q{
String.class_eval do
  def happy?
    # your code here
  end
end
raise "Your first cog fail!" if not ":)".happy?
raise ":] recognizer fail" if not ":]".happy?
      }
    end
    def code_help 
      %q{Imagine you are working on ASCOG Inc. and your next challenge is code an ASC smile recognition trying to idenfiy humam reactions in a natural language. I expect you use String#match? method.}
    end
    def correct_answer 
      :compile
    end
    def tags ; "ruby regexp ascog" end
    def image_url ; "euforico.png" end
    def background_image_url ; "second-background.png" end
  end
end
