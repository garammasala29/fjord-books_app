# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'following_id'
  has_many :followings, thorough: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :followers, thorough: :passive_relationships, source: :following
end
