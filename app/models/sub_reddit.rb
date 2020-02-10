class SubReddit < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :background_picture

  validates :title, :description, presence: true
  validates :title, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 200 }

  has_many :user_sub_reddits
  has_many :members, through: :user_sub_reddits, :source  => :user


  
  #  returns the join status of the user
  #  accepted pending or blocked
  def current_user_joined(usr)
    found = nil
    begin
     found = self.user_sub_reddits.where(user_id: usr.id).first.status  
    rescue Exception => e
    end
  	found
  end


  # returns top five communities based on
  # number of posts
  def self.todays_top_five
     SubReddit.order('posts_count').limit(5)
  end
end
