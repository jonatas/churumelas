require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  setup do
    @challenge = Game.start!
  end
  test "Challenge should pass with valid answers" do
    Challenges.each do |challenge|
      assert challenge.pass_with? challenge.correct_answer
    end
  end
  teardown do
    @game.destroy
  end
end
