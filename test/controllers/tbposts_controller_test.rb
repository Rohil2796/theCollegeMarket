require 'test_helper'

class TbpostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @tbpost = tbposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Tbpost.count' do
      post tbposts_path, params: { tbpost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Tbpost.count' do
      delete tbpost_path(@tbpost)
    end
    assert_redirected_to login_url
  end

   test "should redirect destroy for wrong tbpost" do
    log_in_as(users(:rohil))
    tbpost = tbposts(:tau_manifesto)
    assert_no_difference 'Tbpost.count' do
      delete tbpost_path(tbpost)
    end
    assert_redirected_to root_url
  end
end