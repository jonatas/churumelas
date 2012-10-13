require 'test_helper'

class GameChallengeTest < ActiveSupport::TestCase
   setup do
     @game = Game.create :username => "jonatasdp"
     @game.start!
     assert @game.next_challenge!
   end
   test "Game can start with an anonymous user" do
     assert @game.valid?
   end
   test "Game should have many challenges" do
     assert_equal 2, @game.game_challenges.size
   end
   test "aprove good implementations" do
     oks = [
      "self.match /:\\)|:\\]/", 
      "self.match %r{:\\)|:\\]}"
     ]
     oks.each do |ok|
       assert @game.current_challenge.valid_answer?(ok), "Implementation #{ok.inspect} doesnt work yet"
     end
   end
   test "keep error on bad code and return false to answer" do
     raises = [
      ": )",
      "self-match? /:[)]]/"
     ]
     raises.each do |invalid_code|
       assert_nothing_raised do
         step =  @game.current_challenge
         assert ! step.valid_answer?(invalid_code)
         assert step.last_compiling_error
         assert step.last_compiling_error_trace
       end
     end
   end

   teardown do
     @game.destroy
   end
end
