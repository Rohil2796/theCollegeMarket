require 'test_helper'

class TbpostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bryan)
  end

  test "tbpost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Tbpost.count' do
      post tbposts_path, params: { tbpost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This tbpost really ties the room together"
    assert_difference 'Tbpost.count', 1 do
      post tbposts_path, params: { tbpost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_tbpost = @user.tbpost.paginate(page: 1).first
    assert_difference 'Tbpost.count', -1 do
      delete tbpost_path(first_tbpost)
    end
    # Visit different user (no delete links)
    get user_path(users(:rohil))
    assert_select 'a', text: 'delete', count: 0
  end
end