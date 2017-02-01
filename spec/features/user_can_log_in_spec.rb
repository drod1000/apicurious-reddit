require 'rails_helper'

describe "When a user logs in" do

  it "they can see their information" do
    VCR.use_cassette("login") do
      visit root_path

      stub_omniauth
      click_on("Login with Reddit")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Name: drod2793")
      expect(page).to have_content("Link Karma: 1")
      expect(page).to have_content("Comment Karma: 0")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
      provider: 'reddit',
      uid: '14xe5j',
      info: {
        name: 'drod_2793'
      },
      credentials: {
        token: 'OsSn1vW7nKdD3zM5N4n0sfV1zY8'
      }
      })
  end
end
