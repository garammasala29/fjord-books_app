# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships, class_name: 'FollowingRelationship', foreign_key: 'following_id', dependent: :destroy, inverse_of: 'following'
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: 'FollowingRelationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: 'follower'
  has_many :followers, through: :passive_relationships, source: :following

  def following?(user)
    followings.include?(user)
  end
end
