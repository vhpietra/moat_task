class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.string :year
      t.string :artist

      t.timestamps
    end
  end
end
