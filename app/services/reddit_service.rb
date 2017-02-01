class RedditService
  def self.get_user_info(token)
    conn = Faraday.new
    raw_data = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)
  end
end
