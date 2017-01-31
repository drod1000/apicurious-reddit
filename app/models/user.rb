class User < ApplicationRecord
  validates :name, :uid, :token, presence: true
  validates :name, :uid, uniqueness: true
end
