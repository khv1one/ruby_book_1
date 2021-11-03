require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference('User.count') do
      post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    assert_difference('User.count', 1) do
      post users_path, params: { user: { name: "1234", email: "user@valid.ru", password: "foofoo", password_confirmation: "foofoo" } }
    end
    assert_template @user
  end
end
