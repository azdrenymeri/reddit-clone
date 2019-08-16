class Post < ApplicationRecord
  belongs_to :sub_reddit
  has_many :comments
  
  validates :title,presence: true, length: {minimum: 5,maximum: 30}
  validates :content,presence: true, length: {minimum: 50,maximum: 2000}
  validates :image, presence: true
end
