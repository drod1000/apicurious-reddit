Rails.application.routes.draw do
  root 'home#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show', as: :dashboard
  get '/my_subreddits', to: 'subreddits#index', as: :subreddits
  get '/subreddits/*permalink', to: 'subreddits#show', as: :subreddit
  get '/posts/*permalink', to: 'posts#show', as: :post
end
