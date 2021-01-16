class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  belongs_to :parent, class_name: 'Tweet', optional: true
  # has_many :replies, class_name: 'Tweet', foreign_key: 'parent_id', dependent: :destroy
  has_many :replies, class_name: 'Tweet',
                     foreign_key: 'parent_id',
                     dependent: :nullify,
                     inverse_of: false

  validates :body, presence: true,
                   length: {
                     maximum: 140,
                     message: 'Description length should be at most 140 characters long'
                   }

  def user_attached?
    user.avatar.attached?
  end
end
