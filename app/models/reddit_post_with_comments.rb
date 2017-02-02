class RedditPostWithComments
  attr_reader :title, :body, :permalink, :comments

  def initialize(token, attrs = {})
    @title = attrs[0][:data][:children][0][:data][:title]
    @body = attrs[0][:data][:children][0][:data][:selftext]
    @permalink = attrs[0][:data][:children][0][:data][:permalink]
    @comments = attrs[1][:data][:children].map do |comment|
      RedditComment.new(comment[:data])
    end
  end

  def self.get_single_subreddit_post(token, name)
    json = RedditService.get_single_subreddit_post(token, name)
    RedditPostWithComments.new(token, json)
  end

end
