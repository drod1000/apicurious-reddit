require 'rails_helper'

describe "When a user logs in" do

  it "they can see their information" do
    visit root_path

    stub_omniauth
    click_on("Login with Reddit")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have("Name: some_name")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
      provider: 'reddit',
      uid: '29sk30',
      info: {
        name: 'some_name'
      },
      credentials: {
        token: 'rteQFePx-xaueLBTi6RZLvKuHSU'
      }
      })
  end
end
