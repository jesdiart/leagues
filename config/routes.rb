Rails.application.routes.draw do
  root "home#index"
  
  resources :users
  resources :players
  resources :leagues do
    resources :teams do 
      resources :players, :controller => "team_players"
    end
  end 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
