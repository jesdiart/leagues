Rails.application.routes.draw do
  root "home#index"
  
  resources :users
  resources :players
  resources :leagues do
    resources :teams do 
      resources :players, :controller => "team_players" do
        get 'assign', on: :collection
      end
    end
    resources :games
  end 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
