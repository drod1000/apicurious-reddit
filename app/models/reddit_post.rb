class RedditPost
  attr_reader :title, :permalink, :score

  def initialize(data)
    @title = data[:data][:title]
    @permalink = data[:data][:permalink]
    @score = data[:data][:score]
  end

end
