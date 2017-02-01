class RedditSubreddit
  attr_reader :name, :url

  def initialize(attrs = {})
    @name = attrs[:data][:display_name]
    @url = attrs[:data][:url]
  end

  def self.get_user_subreddits(token)
    RedditService.get_user_subreddits(token)[:data][:children].map do |subreddit|
      RedditSubreddit.new(subreddit)
    end
  end

end