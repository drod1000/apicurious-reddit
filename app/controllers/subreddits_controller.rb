class SubredditsController < ApplicationController
  def index
    @subreddits = RedditSubreddit.get_user_subreddits(current_user.token)
  end

  def show
    @json = RedditService.get_single_subreddit(current_user.token, params[:permalink])
    @subreddit = SubredditWithPosts.new(params[:permalink], @json)
    binding.pry
  end

end
