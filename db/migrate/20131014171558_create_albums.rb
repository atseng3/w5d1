class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, :null => false
      t.string :type, :null => false
      t.integer :band_id, :null => false

      t.timestamps
    end
    add_index :albums, :title, :unique => true
    add_index :albums, :band_id
  end
end
