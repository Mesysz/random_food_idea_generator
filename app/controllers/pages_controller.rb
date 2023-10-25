# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def favorites
    @favorites = SavedMeal.where(user_id: current_user.id)

    @favorites = @favorites.where(category: params.dig(:filters, :category)) if params.dig(:filters, :category)
  end

  def generate
    @meals = TheMealDb.random_meal

    render 'home'
  end

  def search
    @meals = TheMealDb.search_meal(name: params[:search])

    render 'home'
  end
end
