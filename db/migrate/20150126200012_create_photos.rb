class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
    	t.string "file_name"
    	t.integer "property"
    	t.integer "order"
      t.timestamps null: false
    end
    add_index :photos, :property
  end

  def down
  	drop_table :photos
  end
end
