# frozen_string_literal: true

module MealServiceMethods
  extend ActiveSupport::Concern

  REQUIRED_METHODS = %i[random_meal search_meal meal_details meal_categories meal_by_category].freeze

  class_methods do
    def random_meal
      raise NoMethodError
    end

    def search_meal(*)
      raise NoMethodError
    end

    def meal_details(*)
      raise NoMethodError
    end

    def meal_categories
      raise NoMethodError
    end

    def meal_by_category(*)
      raise NoMethodError
    end
  end
end
