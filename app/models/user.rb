# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  validate :validate_image_permission
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def middle_image
    image.variant(resize_to_limit: [200, 200])
  end

  def small_image
    image.variant(resize_to_limit: [50, 50])
  end

  def validate_image_permission
    return unless image.attached?

    extensions = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    errors.add(:image, I18n.t('message.incorrect_extension')) unless image.content_type.in?(extensions)
  end
end
