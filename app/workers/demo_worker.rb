# frozen_string_literal: true

class DemoWorker < ApplicationWorker
  def perform
    Rails.logger.info "====== DEMO ======"
    begin
      Rails.logger.info REDIS_APP.ping
    rescue Redis::BaseError => e
      # Rails.env.production?
      notifier = Slack::Notifier.new SLACK_WEBHOOK
      notifier.post text: "Redis: #{e.message}, Time: #{Time.current}", username: "LeetCode Project"
      # end
    end
  end
end
