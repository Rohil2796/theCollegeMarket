require 'test_helper'

class TbTest < ActiveSupport::TestCase

  def setup
    @user = users(:bryan)
    # This code is not idiomatically correct.
    @tb = @user.TbPost.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @tb.valid?
  end

  test "user id should be present" do
    @tb.user_id = nil
    assert_not @tb.valid?
  end

  test "content should be present" do
    @tb.content = "   "
    assert_not @tb.valid?
  end

  test "content should be at most 1000 characters" do
    @tb.content = "a" * 1001
    assert_not @tb.valid?
  end
end