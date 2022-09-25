class Review < ApplicationRecord
  has_one_attached :reviewimage
  belongs_to :user

  validates :reviewimage, presence: true
  validates :item, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
