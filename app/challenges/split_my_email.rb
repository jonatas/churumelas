challenge :title => "String#split # => cool!",
  :description => "Imagine you're trying to count how much people use what domain in your system. You have the email, try to extract the username and domain separately.",
  :code_challenge => %q{
username, domain = "jonatasdp@gmail.com".# your code here
if username != "jonatasdp"
  raise "ops! username: #{username.inspect} incorrect!"
elsif domain != "gmail.com"
 raise "ops! domain: #{domain} incorrect!"
end},
 :code_help => "There's a cool method named split in the string. These method will help you do the job. If you're into the wild can do with regular expressions too. I strongly advice to use the easy way with split method.",
 :right_answer => "split('@')",
 :image_url => "euforico.png"
