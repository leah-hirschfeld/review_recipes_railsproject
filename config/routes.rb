Rails.application.routes.draw do
  resources :reviews
  resources :recipes

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
