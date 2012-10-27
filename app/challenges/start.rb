challenge :title => "@you.can_start? # => return true",
  :description  =>  %q{Show me the world! Type "start" to face your first challenge!},
  :code_challenge => %q{
console_input = "# your code here"
if console_input !~ /start/i
  raise "Come on! Type 'start'!"
end},
  :code_help  =>  %q{Your code will be replaced on "# your code here" tag. Now proceed typing start},
  :tags  =>  "ruby beginner",
  :image_url  =>  "feliz.png",
  :background_image_url  =>  "start-background.png"
