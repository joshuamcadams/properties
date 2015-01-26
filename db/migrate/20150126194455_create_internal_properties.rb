class CreateInternalProperties < ActiveRecord::Migration
  def up
    create_table :internal_properties do |t|
    	t.string "name", :limit => 50
    	t.decimal "price"
    	t.string "address"
    	t.text "description"
    	t.string "short_description"
    	t.integer "agent"
			t.timestamps null: false
    end
    add_index :internal_properties, :agent
  end

  def down
   	drop_table :internal_properties
   end
end
