# frozen_string_literal: true

module Connectors
  class TheMealDbConnector
    attr_reader :redis

    API = 'www.themealdb.com/api/json/v1/1/'
    @redis = RedisConnector
    REDIS_PREFIX = 'the_meal_db_meal'

    def self.random_meal
      response = RestClient.get [API, 'random.php'].join

      meal = Parsers::TheMealDbParser.new(response.body).to_meals.first

      @redis.set_key(redis_key(meal.meal_id), meal.to_json)

      meal
    end

    def self.search_meal(name:)
      response = RestClient.get [API, 'search.php', '?s=', name].join

      meals = Parsers::TheMealDbParser.new(response.body).to_meals

      meals&.each do |meal|
        @redis.set_key(redis_key(meal.meal_id), meal.to_json)
      end

      meals
    end

    def self.meal_details(meal_id:)
      meal = @redis.get_key(redis_key(meal_id))

      return Meal.from_json(meal) if meal

      response = RestClient.get [API, 'lookup.php', '?i=', meal_id].join

      Parsers::TheMealDbParser.new(response.body).to_meals.first
    end

    def self.meal_categories
      response = RestClient.get [API, 'categories.php'].join

      Parsers::TheMealDbParser.new(response.body).to_categories
    end

    def self.meal_by_category(category_id:)
      response = RestClient.get [API, 'filter.php', '?c=', category_id].join

      Parsers::TheMealDbParser.new(response.body).to_meals
    end

    def self.redis_key(key)
      [REDIS_PREFIX, key].join('_')
    end
  end
end
