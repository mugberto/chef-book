class Following < ApplicationRecord
  belongs_to :follower, classname: 'User', foreign_key: :follower_id
  belongs_to :whom_he_follows, classname: 'User', foreign_key: :following_id
end
