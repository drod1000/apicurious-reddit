class SubredditWithPosts
  attr_reader :name, :posts
  def initialize(name, attrs)
    @name = attrs[0][:data][:subreddit]

    @posts = attrs.map do |post|
      RedditPost.new(post)
    end
  end
end
