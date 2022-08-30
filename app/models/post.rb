class Post < ApplicationRecord
  has_one_attached :postimage
  belongs_to :user
end
