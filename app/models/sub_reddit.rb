class SubReddit < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :background_picture

  validates :title, :description, presence: true
  validates :title, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 200 }
end
