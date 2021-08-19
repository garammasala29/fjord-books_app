# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_image
    image.variant(resize_to_limit: [400, 400])
  end

  def display_image_mini
    image.variant(resize_to_limit: [100, 100])
  end
end
