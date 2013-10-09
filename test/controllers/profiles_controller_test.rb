require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:evis).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "variables assigned on successful profile page viewing" do
  	get :show, id: users(:evis).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "show unly user's statuses" do
  	get :show, id: users(:evis).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:evis), status.user
  	end
  end

end
