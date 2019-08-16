class SubReddit < ApplicationRecord
  belongs_to :user_id
  has_many :posts
  
  validates :title,:decsription, presence: true
  validates :title,length: {minimum: 5, maximum: 30}
  validates :decsription,length: {minimum: 30,maximum: 50}

end
