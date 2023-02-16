# frozen_string_literal: true

# start worker: bundle exec rake environment resque:work QUEUE='*'
class ApplicationWorker
  def self.queue
    :normal
  end

  def self.perform_async(*args)
    Resque.enqueue(self, *args)
  end

  def self.enqueue_at(*args)
    Resque.enqueue_at(args[0], self, *args[1..])
  end

  def self.perform(*args)
    ActiveRecord::Base.connection.enable_query_cache!
    new.perform(*args)
  ensure
    ActiveRecord::Base.connection.clear_query_cache
    ActiveRecord::Base.connection.disable_query_cache!
  end
end
