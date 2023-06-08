require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get dashboard_url
    assert_response :success
  end

  test "should display user-specific information" do
    get dashboard_url

    assert_response :notice
  end
end
