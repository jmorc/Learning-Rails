class RemoveIndexes < ActiveRecord::Migration
  def change
  	remove_index :albums, :band_id
  	remove_index :tracks, :album_id
  end
end