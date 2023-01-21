require "test_helper"

class SignupTest < ActionDispatch::IntegrationTest
  test "get signup path and create new user" do
    get signup_path
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: 'testuser',
                                         email: 'test@test.com',
                                        password: 'testpassword'} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'testuser', response.body

  end
end
