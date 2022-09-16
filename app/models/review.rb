class Review < ApplicationRecord
  has_one_attached :reviewimage
  belongs_to :user

  validates :reviewimage, presence: true
  validates :title, presence: true, length: { maximum: 40 }, obscenity: { message: 'はNGワードになっています' }
  validates :item, presence: true, length: { maximum: 40 }, obscenity: { message: 'はNGワードになっています' }
  validates :body, presence: true, length: { maximum: 200 }, obscenity: { sanitize: true }
end
