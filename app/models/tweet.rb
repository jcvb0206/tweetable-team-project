class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, despendent: :destroy
  has_many :users, through: :likes

  belongs_to :parent, class_name: 'Tweet', optional: true

  has_many :replies, class_name: 'Tweet', foreign_key: 'parent_id', dependent: :destroy, inverse_of: :optional

end
