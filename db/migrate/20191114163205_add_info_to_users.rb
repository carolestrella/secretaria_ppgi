class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :registration, :string
    add_column :users, :role, :integer
  end
end
