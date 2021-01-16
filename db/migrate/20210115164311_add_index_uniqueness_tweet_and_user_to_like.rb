class AddIndexUniquenessTweetAndUserToLike < ActiveRecord::Migration[6.0]
  def change

    add_index :likes, [:tweet_id, :user_id], unique: true

  end
end
