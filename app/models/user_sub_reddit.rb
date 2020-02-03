class UserSubReddit < ApplicationRecord
  belongs_to :user
  belongs_to :sub_reddit
  enum status:[:pending,:accepted, :blocked]
end
