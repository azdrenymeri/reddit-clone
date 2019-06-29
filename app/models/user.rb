class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :picture
  validates :full_name, presence: true,length:{ minimum: 2, maximum:50}
  validates :bio, presence: true,length: {minimum:5 , maximum: 400}
  validates :birth_date, presence: true
  validates :picture, presence: true
end
