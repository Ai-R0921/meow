require "test_helper"

class Admin::TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_types_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_types_destroy_url
    assert_response :success
  end

  test "should get index" do
    get admin_types_index_url
    assert_response :success
  end
end
