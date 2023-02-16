# frozen_string_literal: true

require "test_helper"

class AuthenticateControllerTest < ActiveSupport::TestCase
  test '#token' do
    stub_post = stub_request(:post, '/api/v1/authenticate/token')
    p stub_post

    assert_requested(stub_post)
  end
end
