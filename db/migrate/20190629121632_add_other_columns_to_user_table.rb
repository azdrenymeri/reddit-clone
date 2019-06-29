class AddOtherColumnsToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :bio, :string
    add_column :users, :birth_date, :date
    add_column :users, :picture, :binary
    
  end
end
