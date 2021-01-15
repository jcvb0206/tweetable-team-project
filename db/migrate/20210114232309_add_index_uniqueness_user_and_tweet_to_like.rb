class AddIndexUniquenessUserAndTweetToLike < ActiveRecord::Migration[6.0]
  def change

    validates :tweet_id, uniqueness: { scope: :user_id}
  end
end
