require "test_helper"

class Admin::PostImageCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_image_comments_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_post_image_comments_destroy_url
    assert_response :success
  end
end
