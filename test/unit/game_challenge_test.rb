require 'test_helper'

class GameChallengeTest < ActiveSupport::TestCase
  setup do
    @game = Game.create :username => "jonatasdp"
  end
  test "Game can start with an anonymous user" do
    assert @game.valid?
  end
  test "Game should start by firsty challenges" do
    assert_equal 0, @game.game_challenges.size
    @game.start!
    assert @game.current_level == 1
    assert @game.current_challenge == First
    assert_equal 1, @game.game_challenges.size
  end
  test "should validate answers as normal strings" do
    @game_challenge.challenge = First
    assert @game_challenge.valid_answer?("start")
  end

  test "aprove good implementations" do
    @game_challenge.challenge = Second
    oks = [
      "self.match /:\\)|:\\]/", 
      "self.match %r{:\\)|:\\]}",
      "self == ':)' or self == ':]'"
    ]
    scores = []
    oks.each do |ok|
      @game_challenge.tries_before_sucess = 0
      result = @game_challenge.pass_with!(ok)
      assert result, "Implementation #{ok.inspect} doesnt work yet"
      scores << @game_challenge.score
    end
    assert scores[0] > scores[1]
    assert scores[1] > scores[2]
  end
  test "keep error on bad code and return false to answer" do
    @game_challenge.challenge = Second
    raises = [
      ": )",
      "self-match? /:[)]]/"
    ]

    raises.each do |invalid_code|
      assert_nothing_raised do
        assert ! @game_challenge.pass_with!(invalid_code)
        assert @game_challenge.last_compiling_error
        assert @game_challenge.last_compiling_error_trace
        assert_equal @game_challenge.score, 0
      end
    end
  end
  teardown do
    @game.destroy
  end
end
