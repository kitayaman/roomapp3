class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, through: :reservations
  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :user_image, UserImageUploader

  validates :name, presence: true
  validates :user_image, presence: true, on: :update
  validates :email, uniqueness: true, presence: true
end
