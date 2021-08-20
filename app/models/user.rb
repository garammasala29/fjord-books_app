# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  validate :file_type
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_image
    image.variant(resize_to_limit: [400, 400])
  end

  def display_image_mini
    image.variant(resize_to_limit: [100, 100])
  end

  def file_type
    return unless image.attached?

    extension = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    errors.add(:image, I18n.t('message.incorrect_extension')) unless image.content_type.in?(extension)
  end
end
