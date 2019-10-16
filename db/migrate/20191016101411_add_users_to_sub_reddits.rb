class AddUsersToSubReddits < ActiveRecord::Migration[5.2]
  def change
    add_reference :sub_reddits, :user, foreign_key: true
  end
end
