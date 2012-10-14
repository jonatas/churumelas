require 'test_helper'

class GameChallengeTest < ActiveSupport::TestCase
  setup do
    @game = Game.create :username => "jonatasdp"
    @game.start!
    assert @game.next_challenge!
    @game_challenge = GameChallenge.new 
    @game_challenge.started_at = Time.now
    @game_challenge.start_typing_at = Time.now - 10
  end
  test "Game can start with an anonymous user" do
    assert @game.valid?
  end
  test "Game should have many challenges" do
    assert_equal 2, @game.game_challenges.size
  end
  test "should validate answers as normal strings" do
    @game_challenge.challenge = Challenge.new :correct_answer => "test"
    assert @game_challenge.valid_answer?("test")
  end

  test "aprove good implementations" do
    @game_challenge.challenge = Challenge.all.second
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
    @game_challenge.challenge = Challenge.all.second
    puts @game_challenge.challenge.code_challenge
    raises = [
      ": )",
      "self-match? /:[)]]/"
    ]

    raises.each do |invalid_code|
      #assert_nothing_raised do
        assert ! @game_challenge.pass_with!(invalid_code)
        assert @game_challenge.last_compiling_error
        assert @game_challenge.last_compiling_error_trace
        assert_equal @game_challenge.score, 0
      #end
    end
  end
  teardown do
    @game.destroy
  end
end
