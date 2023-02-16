# frozen_string_literal: true

# ApiBase
module ApiBase
  extend ActiveSupport::Concern

  included do
    include JsonWebToken

    before_action :auth_headers
  end

  def auth_headers
    access_token = request.headers["JWTAuthorization"]
    unless access_token
      render json: { message: "Authorization header not found" }, status: 403
      return false
    end

    decoded = JsonWebToken.decode(access_token&.split(" ")&.last)
    @current_user = User.find(decoded.try(:[], :uid))

    if decoded.nil? || @current_user.login_token != decoded.try(:[], :login_token)
      render json: { message: "Authentication failed" }, status: 530
      return false
    end
  end

  def destroy
    @current_user.update!(login_token: nil)
    render json: { message: "Logout successfully", success: true, data: nil }, status: 200
  end
end
