require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter his first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

   test "a user should enter his last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

   test "a user should enter his profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end
   test "user unique profile name" do
   	user = User.new
   	user.profile_name = users(:evis).profile_name
   	
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end
  test "auser should have a profile name without spaces" do
   	user = User.new(first_name: 'Evaldas', last_name: 'Tikrasis', email: 'evykas@gmail.com')
  	user.password = user.password_confirmation = 'qweasdzxc'

  	user.profile_name = "My Profile with spaces"
  	
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "correctly user profile name" do
  	user = User.new(first_name: 'Evaldas', last_name: 'Tikrasis', email: 'evykas@gmail.com')
  	user.password = user.password_confirmation = 'qweasdzxc'

  	user.profile_name = 'evis_1'
  	assert user.valid?
  end
end
