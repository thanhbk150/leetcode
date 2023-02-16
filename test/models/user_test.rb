# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "invalid" do
    user = User.new
    error_messages = [
      "Email can't be blank",
      "Password can't be blank",
      "Login can't be blank"
    ]

    assert_equal false, user.valid?
    assert_equal error_messages, user.errors.full_messages
  end

  test "valid" do
    user = User.new(email: 'test@example.com', password: '123456', login: 'test')
    assert_equal true, user.valid?
  end
end
