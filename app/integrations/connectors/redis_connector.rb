# frozen_string_literal: true

module Connectors
  class RedisConnector
    attr_reader :redis, :expire_time_s

    @redis = ApplicationHelper.redis
    @expire_time_s = 600

    def self.set_key(key, value)
      @redis.set(key, value)
      @redis.expire(key, @expire_time_s)
    rescue Redis::CannotConnectError
      nil
    end

    def self.get_key(key)
      @redis.get(key)
    rescue Redis::CannotConnectError
      nil
    end
  end
end
