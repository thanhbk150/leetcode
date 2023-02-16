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

    return render json: { message: "Authorization header not found" }, status: 403 unless access_token

    decoded = JsonWebToken.decode(access_token&.split(" ")&.last)
    @current_user = User.find(decoded.try(:[], :uid))

    return render json: { message: "Authentication failed" }, status: 530 if decoded.nil? || @current_user.login_token != decoded.try(:[], :login_token)
  end

  def destroy
    @current_user.update!(login_token: nil)
    render json: { message: "Logout successfully", success: true, data: nil }, status: 200
  end
end
