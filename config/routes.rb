Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    resources :users, only: [:show]
  end
  resource :profile, only: [:show, :edit, :update, :destroy]
  resources :three_d_files
  root 'three_d_files#index'
end