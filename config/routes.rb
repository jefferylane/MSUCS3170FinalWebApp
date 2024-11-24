Rails.application.routes.draw do
  devise_for :users
  resources :three_d_files, only: [:index, :new, :create, :show, :update, :destroy]
  root to: 'three_d_files#index'
end