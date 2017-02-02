class RedditSubredditWithPosts
  attr_reader :name, :posts, :rules

  def initialize(token, attrs)
    @name = attrs[0][:data][:subreddit]
    @posts = attrs.map do |post|
      RedditPost.new(post)
    end
    @rules ||= RedditService.get_subreddit_rules(token, @name).map do |rule|
      rule[:description]
    end
  end

  def self.get_single_subreddit(token, name)
    json = RedditService.get_single_subreddit(token, name)
    RedditSubredditWithPosts.new(token, json)
  end
end
