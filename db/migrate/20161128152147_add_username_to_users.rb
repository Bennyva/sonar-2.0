class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change #anything inside this method is translated to SQL code to modify the database
    add_column :users, :username, :string #add a column to the table users called username of type string
    add_index :users, :username, unique: true #first index username, then ensure that usernames are unique
  end
end
