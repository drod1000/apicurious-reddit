class RedditUser
  attr_reader :name, :link_karma, :comment_karma

  def initialize(attrs = {})
    @name = attrs[:name]
    @link_karma = attrs[:link_karma]
    @comment_karma = attrs[:comment_karma]
  end
end
