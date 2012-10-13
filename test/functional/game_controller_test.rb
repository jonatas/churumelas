require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
    assert assigns(:game_challenge)
    assert assigns(:game)
    assert assigns(:challenge)
  end
  
  test "should start by typing start" do
    post(:answer, :console => { :code => "start" })
    assert assigns(:challenge)
    assert_redirected_to :action => "start"
  end
  test "should not start by typing other tries" do
    bad_words = %w(nil start! \ start `` eval system)
    bad_words.each do |try|
      post(:answer, :console => { :code => try})
      assert_not_nil  flash[:message]
      assert_redirected_to :action => "start" 
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
