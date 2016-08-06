require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { expiredate: @post.expiredate, free: @post.free, name: @post.name, obo: @post.obo, price: @post.price, tb_classname: @post.tb_classname, tb_classnumber: @post.tb_classnumber, tb_edition: @post.tb_edition, tix_eventdate: @post.tix_eventdate, tix_eventname: @post.tix_eventname } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { expiredate: @post.expiredate, free: @post.free, name: @post.name, obo: @post.obo, price: @post.price, tb_classname: @post.tb_classname, tb_classnumber: @post.tb_classnumber, tb_edition: @post.tb_edition, tix_eventdate: @post.tix_eventdate, tix_eventname: @post.tix_eventname } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
