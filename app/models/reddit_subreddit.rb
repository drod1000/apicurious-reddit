class RedditSubreddit
  attr_reader :name, :url, :rules, :posts

  def initialize(token, attrs = {})
    @name = attrs[:data][:display_name]
    @url = attrs[:data][:url]
    @rules = RedditService.get_subreddit_rules(token, @name).map do |rule|
      rule[:description]
    end
  end

  def self.get_user_subreddits(token)
    RedditService.get_user_subreddits(token).map do |subreddit|
      RedditSubreddit.new(token, subreddit)
    end
  end

end
