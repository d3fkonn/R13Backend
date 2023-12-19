require "test_helper"

class CouriersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get couriers_new_url
    assert_response :success
  end

  test "should get create" do
    get couriers_create_url
    assert_response :success
  end

  test "should get update" do
    get couriers_update_url
    assert_response :success
  end

  test "should get edit" do
    get couriers_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get couriers_destroy_url
    assert_response :success
  end

  test "should get index" do
    get couriers_index_url
    assert_response :success
  end

  test "should get show" do
    get couriers_show_url
    assert_response :success
  end
end
