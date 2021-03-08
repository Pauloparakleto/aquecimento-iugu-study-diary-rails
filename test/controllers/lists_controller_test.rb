require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Should not create list with not logged user" do
    get lists_new_url
    assert_response :redirect

    post "/lists",
    params: { list: { name: "", category: "Category_name"} }
    assert_response :redirect      
   end

  test "Should not create list with empity name" do
    sign_in users(:one)
    get lists_new_url
    assert_response :success

    post "/lists",
    params: { list: { name: "", category: "Category_name"} }
    assert_response :success      
   end

   test "Should not create list with minimum name not filled" do
    sign_in users(:one)
    get lists_new_url
    assert_response :success

    post "/lists",
    params: { list: { name: "a", category: "Category_name"} }
    assert_response :success      
   end

   test "Should not create list with empty description not filled" do
    sign_in users(:one)
    get lists_new_url
    assert_response :success

    post "/lists",
    params: { list: { name: "Valid name", description: "", category: "Category_name"} }
    assert_response :success      
   end

   test "Should not create list with empty category" do
    sign_in users(:one)
    get lists_new_url
    assert_response :success

    post "/lists",
    params: { list: { name: "Valid name", description: "", category: ""} }
    assert_response :success      
   end

   test "Should create list with valid params" do
    sign_in users(:one)
    get lists_new_url
    assert_response :success

    post "/lists",
    params: { list: { name: "Ruby", description: "This is the description",
              category: "Category_name"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success      
   end
end
