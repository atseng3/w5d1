class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, :null => false
      t.string :type, :null => false
      t.text  :lyrics, :null => false
      t.integer :album_id, :null => false

      t.timestamps
    end
    add_index :tracks, :name, :unique => true
  end
end
