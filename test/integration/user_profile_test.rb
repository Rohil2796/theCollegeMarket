require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:bryan)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.firstName)
    assert_select 'h1', text: @user.firstName + ' ' + @user.lastName
    assert_select 'h1>img.gravatar'
    assert_match @user.tbpost.count.to_s, response.body
    assert_select 'div.pagination'
    @user.tbpost.paginate(page: 1).each do |tbpost|
      assert_match tbpost.content, response.body
    end
  end
end