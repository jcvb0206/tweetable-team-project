class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_one_attached :avatar

  validates :name, :username, presence: true
  validates :username, uniqueness: true
  enum role: {member: 0, admin: 1}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
