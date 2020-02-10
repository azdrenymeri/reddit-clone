class AddPostsCountToSubReddits < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_reddits, :posts_count, :integer
  end
end
