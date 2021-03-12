Rails.application.routes.draw do
  root "leagues#index"
  
  resources :users
  resources :leagues
end
