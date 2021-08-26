# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  validate :configure_permitted_extensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar
    image.variant(resize_to_limit: [200, 200])
  end

  def small_avatar
    image.variant(resize_to_limit: [50, 50])
  end

  def configure_permitted_extensions
    return unless image.attached?

    extension = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    errors.add(:image, I18n.t('message.incorrect_extension')) unless image.content_type.in?(extension)
  end
end
