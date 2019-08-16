class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :sub_reddit, foreign_key: true
      t.string :title
      t.text :content
      t.binary :image

      t.timestamps
    end
  end
end
