require "test_helper"

class Public::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_stores_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_stores_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get public_stores_show_url
    assert_response :success
  end
end
