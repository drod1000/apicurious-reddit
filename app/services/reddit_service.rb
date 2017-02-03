class RedditService

  def self.raw_response(token, path)
    conn = Faraday.new(:url => "https://oauth.reddit.com#{path}") do |faraday|
      faraday.headers[:Authorization] = "bearer #{token}"
      faraday.adapter  Faraday.default_adapter
    end
    conn.get
  end

  def self.get_user_info(token)
    raw_data = raw_response(token, "/api/v1/me/")
    JSON.parse(raw_data.body, symbolize_names: true)
  end

  def self.get_user_subreddits(token)
    raw_data = raw_response(token, "/subreddits/mine/subscriber")
    JSON.parse(raw_data.body, symbolize_names: true)[:data][:children]
  end

  def self.get_subreddit_rules(token, name)
    raw_data = raw_response(token, "/r/#{name}/about/rules")
    JSON.parse(raw_data.body, symbolize_names: true)[:rules]
  end

  def self.get_single_subreddit(token, permalink)
    raw_data = raw_response(token, "/#{permalink}?type=t3&limit=15")
    JSON.parse(raw_data.body, symbolize_names: true)[:data][:children]
  end

  def self.get_single_subreddit_post(token, permalink)
    raw_data = raw_response(token, "/#{permalink}")
    JSON.parse(raw_data.body, symbolize_names: true)
  end

end
