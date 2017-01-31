class User < ApplicationRecord
  validates :name, :uid, :token, presence: true
  validates :name, :uid, uniqueness: true

  def self.from_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash["uid"])
    if user
      return user
    else
      name = auth_hash["info"]["name"]
      uid = auth_hash["uid"]
      token = auth_hash["credentials"]["token"]
      User.create(name: name, uid: uid, token: token)
    end
  end
end
