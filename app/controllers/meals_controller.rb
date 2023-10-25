# frozen_string_literal: true

class MealsController < ApplicationController
  def save_meal
    meal = TheMealDb.meal_details(meal_id: params[:meal_id])

    SavedMeal.create!(
      name: meal.name,
      category: meal.category,
      description: meal.description,
      user_id: current_user.id,
      source_type: TheMealDb.name,
      source_id: meal.meal_id
    )

    redirect_back_or_to '/', allow_other_host: true
  end

  def remove_meal
    SavedMeal.find(params[:saved_meal_id]).destroy

    redirect_to '/favorites', allow_other_host: true
  end
end
