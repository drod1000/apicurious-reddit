class RedditService

  def self.response(token, path)
    conn = Faraday.new(:url => "https://oauth.reddit.com#{path}") do |faraday|
      faraday.headers[:Authorization] = "bearer #{token}"
      faraday.adapter  Faraday.default_adapter
    end
    parse_and_symbolize(conn.get)
  end

  def self.parse_and_symbolize(raw_response)
    JSON.parse(raw_response.body, symbolize_names: true)
  end

  def self.get_user_info(token)
    response(token, "/api/v1/me/")
  end

  def self.get_user_subreddits(token)
    response(token, "/subreddits/mine/subscriber")[:data][:children]
  end

  def self.get_subreddit_rules(token, name)
    response(token, "/r/#{name}/about/rules")[:rules]
  end

  def self.get_single_subreddit(token, permalink)
    response(token, "/#{permalink}?type=t3&limit=15")[:data][:children]
  end

  def self.get_single_subreddit_post(token, permalink)
    response(token, "/#{permalink}")
  end

end
