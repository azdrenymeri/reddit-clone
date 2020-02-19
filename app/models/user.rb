class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :picture
  
  has_many :sub_reddits
  has_many :comments

  has_many :user_sub_reddits
  has_many :communities,through: :user_sub_reddits, :source => :sub_reddit

  validates :full_name, presence: true,length:{ minimum: 2, maximum:50}
  validates :bio, presence: true,length: {minimum:5 , maximum: 400}
  validates :birth_date, presence: true
  validates :picture, presence: true

  def posts
    ids = self.user_sub_reddits.where(status: UserSubReddit.statuses[:accepted]).pluck(:sub_reddit_id)

    Post.where(sub_reddit_id: ids)
        .limit(50)
        .order(:created_at)
        .reverse
  end

  def joined_communities
    ids = self.user_sub_reddits.where(status: UserSubReddit.statuses[:accepted]).pluck(:sub_reddit_id)
    SubReddit.find(ids)
  end
end
