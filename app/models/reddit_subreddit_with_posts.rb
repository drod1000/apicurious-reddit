class RedditSubredditWithPosts
  attr_reader :name, :posts, :rules

  def initialize(token, data)
    @name = data[0][:data][:subreddit]
    @posts = get_posts(data)
    @rules ||= get_rules(token, @name)
  end

  def self.get_single_subreddit(token, name)
    json = RedditService.get_single_subreddit(token, name)
    RedditSubredditWithPosts.new(token, json)
  end

  def get_posts(data)
    data.map{ |post| RedditPost.new(post)}
  end

  def get_rules(token, name)
    RedditService.get_subreddit_rules(token, name).map { |rule| rule[:description] }
  end
end
