Rails.application.routes.draw do
  root 'home#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show', as: :dashboard
  get '/my_subreddits', to: 'subreddits#index', as: :subreddits
  get '/subreddit/:name', to: 'subreddits#show', as: :subreddit
end
