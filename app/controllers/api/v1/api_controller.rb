# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      include ApiBase
      include Response
    end
  end
end
