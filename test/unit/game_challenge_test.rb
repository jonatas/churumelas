require 'test_helper'

class GameChallengeTest < ActiveSupport::TestCase
   setup do
     @game = Game.create :username => "jonatasdp"
   end
   test "Game can start with an anonymous user" do
     assert @game.valid?
   end
   test "Game should have many challenges" do
     @game.start!
     assert_equal 1, @game.game_challenges.size
     assert @game.next_challenge!
     assert_equal 2, @game.game_challenges.size
     oks = [
      "self.match /:\\)|:\\]/"
     ]
     oks.each do |ok|
       assert @game.current_challenge.valid_answer?(ok), "Implementation #{ok.inspect} doesnt work yet"
     end
     raises = [
      ": )",
      "self match? /:[)]]/"
     ]
     raises.each do |invalid_code|
       assert_raise SyntaxError do
         @game.current_challenge.valid_answer?(invalid_code)
       end
     end
   end

   teardown do
     @game.destroy
   end
end
