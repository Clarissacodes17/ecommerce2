require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get edit_users" do
    get admin_edit_users_url
    assert_response :success
  end

end
