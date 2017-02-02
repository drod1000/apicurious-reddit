class RedditPost
  attr_reader :title, :permalink, :score

  def initialize(attrs = {})
    @title = attrs[:data][:title]
    @permalink = attrs[:data][:permalink]
    @score = attrs[:data][:score]
  end

end
