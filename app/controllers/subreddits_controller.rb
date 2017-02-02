class SubredditsController < ApplicationController
  def index
    @subreddits = RedditSubreddit.get_user_subreddits(current_user.token)
  end

  def show
    @json = RedditService.get_single_subreddit(current_user.token, params[:permalink])
    @subreddit = SubredditWithPosts.new(params[:permalink], @json)
  end

end

class SubredditWithPosts
  attr_reader :name
  def initialize(name, attrs)
    @name = attrs[0][:data][:subreddit]

    @posts = attrs.map do |post|
      RedditPost.new(post)
    end
  end
end
