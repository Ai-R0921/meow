require "test_helper"

class Public::PostLostCatFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_lost_cat_favorites_index_url
    assert_response :success
  end

  test "should get create" do
    get public_post_lost_cat_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_lost_cat_favorites_destroy_url
    assert_response :success
  end
end
