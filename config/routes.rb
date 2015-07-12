Rails.application.routes.draw do
  root to: 'projects#index'
  
  resources :projects do
    resources :users, only: [:create]
  end
  
  devise_for :users
  
  namespace :api do
    resources :notifications, only: [:create]
  end
end
