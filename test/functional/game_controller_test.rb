require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end
  
  test "should start by typing start" do
    post(:answer, :console => { :code => "start" })
    assert_redirected_to :action => "next_level" 
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
