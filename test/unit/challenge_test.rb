require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  test "should validate answers as normal strings" do
    challenge = Challenge.new :correct_answer => "test"
    assert challenge.valid_answer?("test")
  end
end
