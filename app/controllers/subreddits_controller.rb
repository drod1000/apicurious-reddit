class SubredditsController < ApplicationController
  def index
    conn = Faraday.new
    raw_data = conn.get 'https://oauth.reddit.com//subreddits/mine/subscriber' do |req|
      req.headers[:Authorization] = "bearer #{current_user.token}"
    end
    response = JSON.parse(raw_data.body, symbolize_names: true)
    @subreddits = response[:data][:children].map do |subreddit|
      RedditSubreddit.new(subreddit)
    end
    binding.pry
  end
end

class RedditSubreddit
  attr_reader :name, :url

  def initialize(attrs = {})
    @name = attrs[:data][:display_name]
    @url = attrs[:data][:url]
  end
end
