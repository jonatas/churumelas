require 'test_helper'

class GameChallengeTest < ActiveSupport::TestCase
  setup do
    @game = Game.create :username => "jonatasdp"
    @game.start!
  end
  test "Game can start with an anonymous user" do
    assert @game.valid?
  end
  test "Game should start by firsty challenges" do
    assert @game.current_level == 1
    assert @game.current_challenge == First
    assert_equal 1, @game.game_challenges.size
  end
  test "should validate answers as normal strings" do
    assert @game.current_game_challenge.valid_answer?("start")
  end

  test "aprove good implementations" do
    @game.next_challenge!
    assert @game.current_challenge == Second
    oks = [
      "self.match /:\\)|:\\]/", 
      "self.match %r{:\\)|:\\]}",
      "self == ':)' or self == ':]'"
    ]
    scores = []
    oks.each do |ok|
      try=@game.current_game_challenge
      try.tries_before_sucess = 0
      try.start_typing_at = Time.now - 2.seconds
      assert try.pass_with!(ok), "Implementation #{ok.inspect} doesnt work yet"
      scores << try.score
    end
    assert scores[0] > scores[1]
    assert scores[1] > scores[2]
  end
  test "keep error on bad code and return false to answer" do
    @game.next_challenge!
    assert @game.current_challenge == Second
    raises = [
      ": )",
      "self-match? /:[)]]/"
    ]
    raises.each do |invalid_code|
      assert_nothing_raised do
       try = @game.current_game_challenge
        assert ! try.pass_with!(invalid_code)
        assert try.last_compiling_error
        assert try.last_compiling_error_trace
        assert_equal try.score, 0
      end
    end
  end
  teardown do
    @game.destroy
  end
end
