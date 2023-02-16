# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user, if: :user_signed_in?

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_current_user
    Current.user = current_user
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default

    redirect_to(request.referrer || root_path)
  end
end
