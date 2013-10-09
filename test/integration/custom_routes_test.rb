require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "that /login path opens login page" do
  	get '/login'
  	assert_response :success
  end

  test "that /logout path opens logout page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that /register path opens registration page" do
  	get '/register'
  	assert_response :success
  end

  test "correct profile page" do
    get '/evis'
    assert_response :success
    
  end

end
