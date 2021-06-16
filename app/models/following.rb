class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: :follower_id
  belongs_to :whom_he_follows, class_name: 'User', foreign_key: :followed_id
end
