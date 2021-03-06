require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should not get index for not logged user" do
    get lists_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should not get show for not logged user" do
    get lists_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should get index for logged user" do
    sign_in users(:one)
    get lists_url
    assert_response :success    
  end

  test "should get show for logged user" do
    sign_in users(:one)
    get lists_url
    assert_response :success
  end

end
