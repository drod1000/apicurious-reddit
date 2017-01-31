require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    it "is not valid without a name" do
      user = User.new(uid: "some_uid", token: "some_token")

      expect(user).to be_invalid
    end

    it "has a unique name" do
      user_1 =  User.create(name: "some_name", uid: "some_uid", token: "some_token")
      user_2 = User.new(name: "some_name", uid: "different_uid", token: "different_token")

      expect(user_1).to be_valid
      expect(user_2).to be_invalid
    end

    it "is not valid without a uid" do
      user = User.new(name: "some_name", token: "some_token")

      expect(user).to be_invalid
    end

    it "has a unique uid" do
      user_1 =  User.create(name: "some_name", uid: "some_uid", token: "some_token")
      user_2 = User.new(name: "different_name", uid: "some_uid", token: "different_token")

      expect(user_1).to be_valid
      expect(user_2).to be_invalid
    end

    it "is not valid without a token" do
      user = User.new(name: "some_name", uid: "some_uid")

      expect(user).to be_invalid
    end

    it "is valid with all attributes" do
      user = User.new(name: "some_name", uid: "some_uid", token: "some_token")

      expect(user).to be_valid
    end
  end
end
