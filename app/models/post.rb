class Post < ApplicationRecord
  belongs_to :sub_reddit
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :content, presence: true, length: { minimum: 10, maximum: 2000 }
  # validates :image, presence: true
end
