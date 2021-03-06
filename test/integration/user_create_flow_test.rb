require "test_helper"

class UserCreateFlowTest < ActionDispatch::IntegrationTest
=begin
  test "Should not create user with empity email" do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: "ab", email: "", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :success      
   end

  test "Should not create user with name equal to empy string" do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: "", email: "louis.camoes@gmail.com", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :success      
   end

  test "Should not create user without name to short" do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: "a", email: "louis.camoes@gmail.com", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :success      
   end
  test "Should not create user without name" do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: nil, email: "louis.camoes@gmail.com", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :success      
   end 
  test "Should create valid user" do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: "Louis2", email: "louis.camoes3@gmail.com", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :redirect
      follow_redirect!
      assert_response :success      
   end

   test "Should not create user with invalid email: " do
    get new_user_registration_path
     assert_response :success

     post "/users",
     params: { user: { name: "Louis", email: "louis.camoesgmail.com", 
                                      password: "ronaldinho3", 
                                      password_confirmation: "ronaldinho3"} }
      assert_response :success      
   end

   test "should not create user with invalid email 2" do
    assert_no_difference("User.count") do
      post users_url, params: { user: { name: "Louis", email: "louis.camoesgmail.com", 
                                        password: "ronaldinho3", 
                                        password_confirmation: "ronaldinho3"} }
    end
  
  end
=end
end
