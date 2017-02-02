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

end
