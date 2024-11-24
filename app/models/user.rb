class User < ApplicationRecord
  has_many :three_d_files
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
