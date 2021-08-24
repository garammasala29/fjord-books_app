class Relationship < ApplicationRecord
  belongs_to :following_id, class_name: 'User'
  belongs_to :follower_id, class_name: 'User'
end
