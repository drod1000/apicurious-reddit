class RedditComment
  attr_reader :body

  def initialize(data)
    @body = data[:body]
  end
end
