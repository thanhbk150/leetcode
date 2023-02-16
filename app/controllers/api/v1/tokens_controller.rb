# frozen_string_literal: true

module Api
  module V1
    # TokensController
    class TokensController < ActionController::API
      include JsonWebToken

      # POST /api/v1/token
      def create
        json = {
          success: false,
          data: [],
          message: ''
        }
        status = 200

        user = User.find_by_id(params[:uid])
        if user
          user.update!(login_token: SecureRandom.hex)
          access_token = JsonWebToken.encode(uid: user.id, login_token: user.login_token)

          json[:success] = true
          json[:data] = { access_token: access_token, token_type: "Bearer" }
        else
          json[:message] = 'Not found'
          status = 404
        end

        render json: json, status: status
      end
    end
  end
end
