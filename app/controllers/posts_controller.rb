class PostsController < ApplicationController
  def show
    @json = RedditService.get_single_subreddit_post(current_user.token, params[:permalink])
    @post_with_comments = RedditPostWithComments.new(current_user.token, @json)
  end
end
