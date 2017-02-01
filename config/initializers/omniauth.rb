Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_SECRET"], scope: 'identity,mysubreddits,read', duration: 'permanent'
end
