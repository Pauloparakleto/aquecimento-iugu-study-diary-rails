require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
=begin
  test "Not logged user should redirect on try get users index" do

    get list_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end


  test "Admin logged should get users index" do
    sign_in users(:one)

    get users_url
    assert_response :success
  end

  test "Non admin user logged in should redirect on try get users index" do
    sign_in users(:two)

    get users_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
=end
end
