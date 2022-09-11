class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
      user.birthdate = Date.today
      user.sex = "その他"
    end
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("nickname LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("nickname LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("nickname LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("nickname LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
