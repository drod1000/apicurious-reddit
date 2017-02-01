class RedditSubreddit
  attr_reader :name, :url

  def initialize(attrs = {})
    @name = attrs[:data][:display_name]
    @url = "https://www.reddit.com#{attrs[:data][:url]} "
  end

  def self.get_user_subreddits(token)
    RedditService.get_user_subreddits(token).map do |subreddit|
      RedditSubreddit.new(subreddit)
    end
  end

end
