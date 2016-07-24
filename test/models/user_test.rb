require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(firstName: "Example", lastName: "User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

   test "first name should be present" do
    @user.firstName = ""
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.lastName = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

end