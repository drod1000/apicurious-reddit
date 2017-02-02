class SubredditsController < ApplicationController
  def index
    @subreddits = RedditSubreddit.get_user_subreddits(current_user.token)
  end

  def show
    @subreddit = RedditSubreddit.get_single_subreddit(current_user.token, params[:name])
  end

  def posts
    @json = RedditService.get_subreddit_posts(current_user.token, params[:name])
    @posts = @json.map do |post|
      RedditPost.new(current_user.token, post)
    end
  end
end
