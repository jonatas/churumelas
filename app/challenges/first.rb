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
      %q{if @challenge.valid_answer? params[:console][:code]
  redirect_to :action =>:next_level
else
  flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
  redirect_to :action => :start
end}
    end
    def code_help 
      %q{Imagine you are coding a system like me and want to be redirected to the first level you will need to pass the correct word.}
    end
    def correct_answer 
      "start"
    end

    def tags ; "ruby beginner" end
    def image_url ; "feliz.png" end
    def background_image_url ; "start-background.png" end
  end
end
