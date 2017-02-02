class RedditPost
  attr_reader :title, :permalink

  def initialize(attrs = {})
    @title = attrs[:data][:title]
    @permalink = attrs[:data][:permalink]
  end

  def self.get_subreddit_posts(token, name)
    RedditService.get_subreddit_posts(token, name).map do |post|
      RedditPost.new(token, post)
    end
  end

end
