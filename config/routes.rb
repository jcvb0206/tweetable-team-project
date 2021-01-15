Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: %i[create edit update show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
