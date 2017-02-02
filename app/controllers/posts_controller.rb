class PostsController < ApplicationController
  def show
    @json = RedditService.get_single_subreddit_post(current_user.token, params[:permalink])
    binding.pry
  end
end
