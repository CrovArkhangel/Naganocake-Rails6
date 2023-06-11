require "test_helper"

class Public::CustomoersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customoers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customoers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_customoers_update_url
    assert_response :success
  end

  test "should get confirm_withdraw" do
    get public_customoers_confirm_withdraw_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_customoers_withdraw_url
    assert_response :success
  end
end
