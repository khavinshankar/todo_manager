class AddFirstNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password_digest, :string
    remove_column :users, :name, :string
    remove_column :users, :password, :string
  end
end
