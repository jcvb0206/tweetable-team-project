class Like < ApplicationRecord
  
  belongs_to :user
  belongs_to :tweet, counter_cache: true
  validates :tweet_id, uniqueness: { scope: :user_id }

  after_create :increment_counter_likes
  after_destroy :decrement_counter_likes

  def increment_counter_likes
    tweet.increment(:likes_count)
    tweet.save
  end

  def decrement_counter_likes
    tweet.decrement(:likes_count)
    tweet.save
  end

end
