class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  has_many :reservations

  def self.search(search)
    if search
      Room.where(['address LIKE ?',"%#{search}%"])
    else
      Room.all
    end
  end

  validates :name, presence: true
  validates :room_image, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
end
