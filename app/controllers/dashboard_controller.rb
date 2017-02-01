class DashboardController < ApplicationController
  def show
    @user = RedditUser.get_user_info(current_user.token)
  end
end
