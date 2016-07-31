require 'test_helper'

class TbpostTest < ActiveSupport::TestCase

  def setup
    @user = users(:bryan)
    @tbpost = Tbpost.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @tbpost.valid?
  end

  test "user id should be present" do
    @tbpost.user_id = nil
    assert_not @tbpost.valid?
  end

  test "content should be present" do
    @tbpost.content = "   "
    assert_not @tbpost.valid?
  end

  test "content should be at most 1000 characters" do
    @tbpost.content = "a" * 1001
    assert_not @tbpost.valid?
  end

  test "order should be most recent first" do
    assert_equal tbposts(:most_recent), Tbpost.first
  end
end