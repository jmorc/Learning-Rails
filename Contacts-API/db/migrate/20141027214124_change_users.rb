class ChangeUsers < ActiveRecord::Migration
  
  
  def up
    add_column :users, :username, :string, presence: true, uniqueness: true
    remove_column :users, :name
    remove_column :users, :email  
  end
  
  def down
    remove_column :users, :username
    add_column :users, :name, :string, presence: true
    add_column :users, :email, :string, presence: true
  end
    
end
