class UserSubReddit < ApplicationRecord
  belongs_to :user
  belongs_to :sub_reddit, :counter_cache =>  :members_count 
  enum status:[:pending,:accepted, :blocked]
end
