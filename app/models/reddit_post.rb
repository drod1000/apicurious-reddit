class RedditPost
  attr_reader :title, :permalink

  def initialize(token, attrs = {})
    @title = attrs[:data][:title]
    @permalink = attrs[:data][:permalink]
  end
end
