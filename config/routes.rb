Rails.application.routes.draw do
  root to: "home#index"

  get "/about", to: "about#index"

  get "/sign-up", to: "registrations#new"
  post "/sign-up", to: "registrations#create"

  get "/sign-in", to: "sessions#new"
  post "/sign-in", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/password", to: "passwords#edit"
  patch "/password", to: "passwords#update"

  get "/password/reset", to: "passwords_reset#new"
  post "/password/reset", to: "passwords_reset#create"
  get "/password/reset/edit", to: "passwords_reset#edit"
  patch "/password/reset/edit", to: "passwords_reset#update"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
end
