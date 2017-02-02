class RedditComment
  attr_reader :body

  def initialize(attrs = {})
    @body = attrs[:body]
  end
end
