class User < ApplicationRecord
  has_many :followers, classname: 'Following', foreign_key: :follower_id
  has_many :people_he_follows, classname: 'Following', foreign_key: :following_id
end
