# frozen_string_literal: true

module App
  # ApplicationController
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def index
      render template: 'app/application'
    end
  end
end
