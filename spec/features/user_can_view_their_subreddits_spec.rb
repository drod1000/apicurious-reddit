require 'rails_helper'

context "a logged in user" do
  it "can see their subreddits" do
    VCR.use_cassette("subreddits") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.first)

      visit subreddits_path

      expect(page).to have_content("sports")
      expect(page).to have_content("worldnews")
    end
  end
end
