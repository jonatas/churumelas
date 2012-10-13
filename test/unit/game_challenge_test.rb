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
     @game.should have(1).game_challenges
   end

   teardown do
     @game.destroy
   end
end
