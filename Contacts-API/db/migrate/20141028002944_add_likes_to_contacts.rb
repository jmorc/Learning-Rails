class AddLikesToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorites, :boolean
  end
end
