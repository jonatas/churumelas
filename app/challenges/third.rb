class Third
  class << self
    def level; 3 end
    def title ;%q{method(:happy?).allow? :noose # => true} end
    def description 
      %q{It's time to enjoy with advanced noose recognition. Modify the code to accept all the code challenge bellow}
    end
    def code_challenge 
%q{
String.class_eval do
  def happy?
    # your code here
  end
end
[":]",":)",":-)",":-]"].each do |smile|
  if not smile.happy?
    raise "the #{smile} was not recognized"
  end
end
}
    end
    def code_help 
      %q{Imagine the ASCOG Inc. is so pragmatic and you need to use the best solution around it. Remember the noose is an alternative. I expect you use String#match? method.}
    end
    def correct_answer; :compile end
    def tags; "ruby regexp ascog" end
    def image_url; "amigo-esperando.png" end
    def background_image_url; "third-background.png" end
  end
end
