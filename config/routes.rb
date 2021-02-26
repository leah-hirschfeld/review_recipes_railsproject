Rails.application.routes.draw do
  resources :reviews
  
  resources :recipes, only: [:new, :create, :edit, :show, :index] do 
    resources :reviews, only: [:index, :new, :create]
  end


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

end
