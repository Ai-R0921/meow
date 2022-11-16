require "test_helper"

class Public::PostImageFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_image_favorites_index_url
    assert_response :success
  end

  test "should get create" do
    get public_post_image_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_image_favorites_destroy_url
    assert_response :success
  end
end
