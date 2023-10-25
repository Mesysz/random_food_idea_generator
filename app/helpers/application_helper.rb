# frozen_string_literal: true

module ApplicationHelper
  class << self
    def redis
      @redis ||= ConnectionPool::Wrapper.new do
        Redis.new
      end
    end
  end
end
