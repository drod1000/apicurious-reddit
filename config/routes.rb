Rails.application.routes.draw do
  root 'home#index'
  get '/auth/reddit', as: :reddit_login
  get 'users/auth/reddit/callback', to: 'sessions#create'
end
