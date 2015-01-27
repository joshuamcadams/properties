class CreateUsers < ActiveRecord::Migration
	def up
    create_table :users do |t|
    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 5
    	t.string "title", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "password", :limit => 40
    	t.text "bio"
		t.timestamps null: false
		end
	end

	def down
		drop_table :users
  end
end

