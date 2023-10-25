# frozen_string_literal: true

module Parsers
  class TheMealDbParser
    attr_reader :response

    def initialize(response)
      @response = JSON.parse(response, symbolize_names: true)
    end

    def to_meals
      response[:meals]&.map do |data|
        meal = Meal.new
        meal.meal_id = data[:idMeal]
        meal.name = data[:strMeal]
        meal.category = data[:strCategory]
        meal.description = data[:strInstructions]
        meal.source = TheMealDb.name
        meal
      end
    end

    def to_categories
      response[:categories].map do |data|
        category = Category.new
        category.id_category = data[:idCategory]
        category.str_category = data[:strCategory]
        category.str_category_description = data[:strCategoryDescription]
        category
      end
    end
  end
end
