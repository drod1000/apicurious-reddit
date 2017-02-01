require 'rails_helper'

describe RedditService do
  context ".get_user_info(token)" do
    it "returns info for current user" do
      VCR.use_cassette("user_info") do
        raw_user_info = RedditService.get_user_info(User.first.token)

        expect(raw_user_info).to be_a(Hash)
        expect(raw_user_info).to have_key(:name)
        expect(raw_user_info).to have_key(:link_karma)
        expect(raw_user_info).to have_key(:comment_karma)
      end
    end
  end

  context ".get_user_subreddits(token)" do
    it "returns subreddits for current user" do
      VCR.use_cassette("user_subreddits") do
        subreddits = RedditService.get_user_subreddits(User.first.token)

        expect(subreddits).to be_an(Array)

        subreddit = subreddits.first

        expect(subreddit).to be_a(Hash)
        expect(subreddit).to have_key(:data)

        subreddit_data = subreddit[:data]

        expect(subreddit_data).to have_key(:display_name)
        expect(subreddit_data).to have_key(:url)
      end
    end
  end

  context ".get_subreddit_rules" do
    it "returns rules for a subreddit" do
      VCR.use_cassette("subreddit_rules") do
        rules = RedditService.get_subreddit_rules(User.first.token, "worldnews")

        expect(rules).to be_an(Array)

        rule = rules.first

        expect(rule).to be_a(Hash)
        expect(rule).to have_key(:description)
        binding.pry
      end
    end
  end
end
