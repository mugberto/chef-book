class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true

  has_many :followers, class_name: 'Following', foreign_key: :follower_id
  has_many :people_he_follows, class_name: 'Following', foreign_key: :followed_id
  has_many :recipes
end
