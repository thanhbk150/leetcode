# frozen_string_literal: true

# config/initializers/redis.rb
REDIS_APP = Redis::Namespace.new "leetcode-redis", redis: Redis.new
