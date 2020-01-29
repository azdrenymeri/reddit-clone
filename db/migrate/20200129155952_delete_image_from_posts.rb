class DeleteImageFromPosts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :posts, :image, :binary
  end
end
