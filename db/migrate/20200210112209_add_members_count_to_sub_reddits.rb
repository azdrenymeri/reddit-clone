class AddMembersCountToSubReddits < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_reddits, :members_count, :integer
  end
end
