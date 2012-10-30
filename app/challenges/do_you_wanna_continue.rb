challenge :title =>  "@you.can_continue? # => return true",
  :description =>  %q{Show me that you can continue! Declare that you can continue on the following code:},
  :code_challenge => %q{
i_wanna = Struct.new(:continue).new(false)
# your code here
raise "Come! continue! set i.continue to true'!" if not i_wanna.continue
raise "Come! set it to true" if not i_wanna.continue == true },
  :code_help =>  %q{Your code will be replaced on "# your code here" tag. Now proceed attributing the continue value to i_wanna local variable},
  :tags  =>  "ruby beginner",
  :image_url  =>  "sem-graca.png"
