require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  setup  do
    @challenge = Challenge.all.second
  end
  test "should validate answers as normal strings" do
    challenge = Challenge.new :correct_answer => "test"
    assert challenge.valid_answer?("test")
  end

   test "aprove good implementations" do
     oks = [
      "self.match /:\\)|:\\]/", 
      "self.match %r{:\\)|:\\]}"
     ]
     oks.each do |ok|
       assert @challenge.valid_answer?(ok), "Implementation #{ok.inspect} doesnt work yet"
     end
   end
   test "keep error on bad code and return false to answer" do
     raises = [
      ": )",
      "self-match? /:[)]]/"
     ]
     raises.each do |invalid_code|
       assert_nothing_raised do
         assert ! @challenge.valid_answer?(invalid_code)
         assert @challenge.last_compiling_error
         assert @challenge.last_compiling_error_trace
       end
     end
   end
end
