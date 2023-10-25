# frozen_string_literal: true

class TheMealDb
  include MealServiceMethods

  @connector = Connectors::TheMealDbConnector

  def self.random_meal
    [@connector.random_meal]
  end

  def self.search_meal(name:)
    @connector.search_meal(name:)
  end

  def self.meal_details(meal_id:)
    @connector.meal_details(meal_id:)
  end

  def self.meal_categories
    @connector.meal_categories
  end

  def self.meal_by_category(category:)
    @connector.meal_by_category(category_id: category.id_category)
  end
end
