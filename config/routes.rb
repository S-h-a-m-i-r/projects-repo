Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete'/logout', to: 'sessions#destroy'
  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  root "main#index"
end
