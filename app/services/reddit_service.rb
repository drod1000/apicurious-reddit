class RedditService
  def self.get_user_info(token)
    conn = Faraday.new
    raw_data = conn.get 'https://oauth.reddit.com/api/v1/me/' do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)
  end

  def self.get_user_subreddits(token)
    conn = Faraday.new
    raw_data = conn.get 'https://oauth.reddit.com/subreddits/mine/subscriber' do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)[:data][:children]
  end

  def self.get_subreddit_rules(token, name)
    conn = Faraday.new
    raw_data = conn.get "https://oauth.reddit.com/r/#{name}/about/rules" do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)[:rules]
  end

  def self.get_subreddit_posts(token, name)
    conn = Faraday.new
    raw_data = conn.get "https://oauth.reddit.com/r/personalfinance?type=t3&limit=15" do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)[:data][:children]
  end

  def self.get_single_subreddit(token, permalink)
    conn = Faraday.new
    raw_data = conn.get "https://oauth.reddit.com/#{permalink}?type=t3&limit=15" do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)[:data][:children]
  end

  def self.get_single_subreddit_post(token, permalink)
    conn = Faraday.new
    raw_data = conn.get "https://oauth.reddit.com/#{permalink}" do |req|
      req.headers[:Authorization] = "bearer #{token}"
    end
    JSON.parse(raw_data.body, symbolize_names: true)
  end
end
