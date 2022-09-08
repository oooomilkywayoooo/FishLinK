class Post < ApplicationRecord
  has_one_attached :postimage
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def gooded?(user)
   goods.where(user_id: user.id).exists?
  end

  def already_favorited?(user) #引数を受け取るように設定
    favorites.where(user_id: user.id).exists?
  end
end
