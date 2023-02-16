# frozen_string_literal: true

module ApplicationHelper
  def sidebar_active?(name)
    controller.controller_name == name ? "active" : ''
  end
end
