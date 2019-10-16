class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_index "users_id", name: "index_sub_reddits_on_users_id"
    remove_column :sub_reddits, :users_id
  end
end
