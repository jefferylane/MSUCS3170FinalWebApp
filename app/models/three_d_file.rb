class ThreeDFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :name, presence: true
  validates :file, presence: true
  validates :description, presence: true
end