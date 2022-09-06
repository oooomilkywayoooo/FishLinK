class Post < ApplicationRecord
  has_one_attached :postimage
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
