require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bryan)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstName:  "",
    										  lastName:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end

   test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    firstName  = "Foo"
    lastName = "Bar"
    email = "foo@bar.com"
	patch user_path(@user), params: { user: { firstName:  "",
    										  lastName:  "",
                                              email: "foo@invalid",
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal firstName,  @user.firstName
    assert_equal email, @user.email

    assert_nil session[:forwarding_url]
    log_in_as(@user)
    assert_redirected_to user_url(@user)
  end
end