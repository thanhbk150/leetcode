# frozen_string_literal: true

module Api
  module V1
    # UsersController
    class UsersController < ApiController
      # GET /api/v1/users
      def index
        @users = User.page(params[:page] || 1).per(params[:per_page] || 10)
        json_response(@users)
      end

      # POST /api/v1/users/import
      def import
        # use activerecord-import
        # User.import users
        json_response([])
      end
    end
  end
end
