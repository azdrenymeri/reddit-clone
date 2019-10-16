class RemoveSubRedditIndexFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_index "sub_reddit_id", name: "index_posts_on_sub_reddit_id"
    remove_column :posts, :sub_reddit_id
  end
end
