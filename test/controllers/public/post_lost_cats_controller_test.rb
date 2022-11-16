require "test_helper"

class Public::PostLostCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_lost_cats_new_url
    assert_response :success
  end

  test "should get create" do
    get public_post_lost_cats_create_url
    assert_response :success
  end

  test "should get index" do
    get public_post_lost_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_lost_cats_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_lost_cats_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_post_lost_cats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_lost_cats_destroy_url
    assert_response :success
  end
end
