# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/generate', to: 'pages#generate'
  get '/favorites', to: 'pages#favorites'
  get '/search', to: 'pages#search'
  post '/save_meal', to: 'meals#save_meal'
  post '/remove_meal', to: 'meals#remove_meal'

  root 'pages#home'
end
