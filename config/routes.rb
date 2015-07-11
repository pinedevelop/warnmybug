Rails.application.routes.draw do
  root to: 'projects#index'
  
  resources :projects
  devise_for :users
  
  namespace :api do
    resources :notifications, only: [:create]
  end
end
