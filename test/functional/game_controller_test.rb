require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
    assert assigns(:game_challenge)
    assert assigns(:game)
    assert assigns(:challenge) == Challenge.first
    post(:answer, :console => { :code => "start" }, 
         :game_challenge_id => assigns(:game_challenge).id)
    assert assigns(:challenge) == Challenge.all.second
  end
  
  test "should start by typing start" do
    post(:answer, :console => { :code => "start" })
    assert assigns(:game_challenge)
    assert_template "start"
  end
  test "should not start by typing other tries" do
    get :start
    challenge_id = assigns(:game_challenge)
    bad_words = %w(nil start! \ start `` eval system)
    bad_words.each do |try|
      post(:answer, :console => { :code => try}, :game_challenge_id => challenge_id)
      assert_not_nil  flash[:message]
      assert_template "start"
    end
  end

  test "should get next_level" do
    get :next_level
    assert_response :success
  end

  test "should get finish" do
    get :finish
    assert_response :success
  end

  test "should get scores" do
    get :scores
    assert_response :success
  end

end
