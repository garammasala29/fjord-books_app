class User < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, format: {with: /\A\d{7}\z/}, allow_blank: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
