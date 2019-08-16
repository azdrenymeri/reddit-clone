class CreateSubReddits < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_reddits do |t|
      t.references :users, foreign_key: true
      t.string :title
      t.text :description
      t.binary :picture

      t.timestamps
    end
  end
end
