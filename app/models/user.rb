class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true

  has_many :followings, class_name: 'Following', foreign_key: :follower_id
  has_many :reversed_followings, class_name: 'Following', foreign_key: :followed_id
  has_many :people_he_follows, through: :followings, source: :whom_he_follows
  has_many :followers, through: :reversed_followings
  has_many :recipes

  def self.authenticated(user_params)
    one? { |user| user.username == user_params[:username] }
  end

  def recipes_of_people_he_follows_and_his
    Recipe.where(user: (people_he_follows.to_a << self)).ordered_by_most_recent
  end
end
