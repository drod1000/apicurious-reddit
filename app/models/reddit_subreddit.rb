class RedditSubreddit
  attr_reader :name, :url, :rules, :posts

  def initialize(token, data)
    @name = data[:data][:display_name]
    @url = data[:data][:url]
  end

  def self.get_user_subreddits(token)
    RedditService.get_user_subreddits(token).map do |subreddit|
      RedditSubreddit.new(token, subreddit)
    end
  end

end
