challenge :title =>%q{method(:happy?).allow? :noose # => true},
  :description => %q{It's time to enjoy with advanced noose recognition. Modify the code to accept all the code challenge bellow},
  :code_challenge => %q{
String.class_eval do
  def happy?
    # your code here
  end
end
[":]",":)",":-)",":-]"].each do |smile|
  if not smile.happy?
    raise "the #{smile} was not recognized"
  end
end},
   :code_help => %q{Imagine the ASCOG Inc. is so pragmatic and you need to use the best solution around it. Remember the noose is an alternative. I expect you use String#match? method.},
  :tags =>  "ruby regexp ascog",
  :image_url =>  "amigo-esperando.png",
  :valid_answer => "self.match /[#:8=]-?[\\)\\]]/"
