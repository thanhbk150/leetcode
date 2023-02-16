# frozen_string_literal: true

require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task setup: :environment do
    require 'resque'
    Resque.redis = ENV['REDIS_URL'] || 'localhost:6379'

    Resque.after_fork do
      Retryable.retryable(tries: 5) do
        Resque.redis.reconnect
      end

      ActiveRecord::Base.clear_active_connections!
    end
  end

  task setup_schedule: :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
  end

  task scheduler: :setup_schedule
end
