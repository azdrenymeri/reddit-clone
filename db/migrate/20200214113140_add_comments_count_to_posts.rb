class AddCommentsCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comments_count, :integer
  end
end
