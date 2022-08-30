class Review < ApplicationRecord
  has_one_attached :reviewimage
  belongs_to :user
end
