class AddUniqueIndexOnLikes < ActiveRecord::Migration
  def change
    add_index :likes, %i(user_id image_id), unique: true
  end
end
