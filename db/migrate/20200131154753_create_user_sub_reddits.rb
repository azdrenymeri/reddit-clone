class CreateUserSubReddits < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sub_reddits do |t|
      t.references :user, foreign_key: true
      t.references :sub_reddit, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
