Rails.application.routes.draw do
  resources :posts
  resource :counter, only: [:show] do
    post :add
    post :remove
  end


   root "posts#index"
   
end
