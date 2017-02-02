class PostsController < ApplicationController
  def show
    @post = RedditPostWithComments.get_single_subreddit_post(current_user.token, params[:permalink])
  end
end
