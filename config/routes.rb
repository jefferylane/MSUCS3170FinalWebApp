Rails.application.routes.draw do
  devise_for :users
  resource :profile, only: [:show, :edit, :update]
  resources :three_d_files

  root to: 'three_d_files#index'
end