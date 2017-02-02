class SubredditsController < ApplicationController
  def index
    @subreddits = RedditSubreddit.get_user_subreddits(current_user.token)
  end

  def show
    @subreddit = RedditSubredditWithPosts.get_single_subreddit(current_user.token, params[:permalink])
  end

end
