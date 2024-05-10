class AddToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :bio, :text
  end
end
