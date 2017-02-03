class RedditUser
  attr_reader :name, :link_karma, :comment_karma

  def initialize(data)
    @name = data[:name]
    @link_karma = data[:link_karma]
    @comment_karma = data[:comment_karma]
  end

  def self.get_user_info(token)
    new(RedditService.get_user_info(token))
  end
end
