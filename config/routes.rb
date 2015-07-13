Rails.application.routes.draw do
  root to: 'projects#index'
  
  devise_for :users
  
  resources :projects do
    resources :users, only: [:create]
    resources :notifications, only: [:show]
  end

  namespace :api do
    resources :notifications, only: [:create]
  end
end
