class User < ApplicationRecord
  has_many :three_d_files
  has_one_attached :avatar
  
  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
