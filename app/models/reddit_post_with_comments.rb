class RedditPostWithComments
  attr_reader :title, :body, :permalink, :comments

  def initialize(token, data)
    @title = get_post_info(data)[:title]
    @body = get_post_info(data)[:selftext]
    @permalink = get_post_info(data)[:permalink]
    @comments = get_comments(data)
  end

  def get_post_info(data)
    data[0][:data][:children][0][:data]
  end

  def self.get_single_subreddit_post(token, name)
    json = RedditService.get_single_subreddit_post(token, name)
    RedditPostWithComments.new(token, json)
  end

  def get_comments(data)
    data[1][:data][:children].map do |comment|
      RedditComment.new(comment[:data])
    end
  end

end
