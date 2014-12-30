class AddLikesToContactShares < ActiveRecord::Migration
  def change
     add_column :contact_shares, :favorites, :boolean
  end
end
