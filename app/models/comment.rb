class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user,:post, presence:true
  validates :content, presence: true, length: {minimum: 2, maximum: 500}
end
