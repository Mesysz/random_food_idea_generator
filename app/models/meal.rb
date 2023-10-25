# frozen_string_literal: true

class Meal
  attr_accessor :meal_id, :name, :category, :description, :source

  def self.from_json(json)
    params = JSON.parse(json, symbolize_names: true)
    meal = Meal.new
    meal.meal_id = params[:meal_id]
    meal.name = params[:name]
    meal.category = params[:category]
    meal.description = params[:description]
    meal.source = params[:source]
    meal
  end

  def self.from_database(saved_meal)
    m = Meal.new
    m.name = saved_meal.name
    m.category = saved_meal.category
    m.description = saved_meal.description
    m
  end

  def saved?
    SavedMeal.exists?(source_id: meal_id, source_type: source)
  end
end
