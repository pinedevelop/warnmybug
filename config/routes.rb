Rails.application.routes.draw do
  root to: 'projects#index'
  
  devise_for :users
  
  resources :projects do
    resources :environments, only: [:show, :new, :create] do
      resources :notifications, only: [:show]
      resources :environment_preferences, only: [:update]
      resources :user_preferences, only: [:update]
    end
    resources :users, only: [:create]
  end

  namespace :api do
    resources :notifications, only: [:create]
  end
end
