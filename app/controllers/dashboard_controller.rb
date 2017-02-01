class DashboardController < ApplicationController
  def show
    conn = Faraday.new
    raw_data = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
      req.headers[:Authorization] = "bearer #{current_user.token}"
    end
    response = JSON.parse(raw_data.body, symbolize_names: true)
    @user = RedditUser.new(response)
  end
end
