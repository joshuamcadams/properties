class AlterPhoto < ActiveRecord::Migration
  def up
  	remove_index("photos", "property")
  	rename_column("photos", "property", "internal_property_id")
  	add_index("photos", "internal_property_id")
  end

  def down
  	remove_index("photos", "internal_property_id")
  	rename_column("photos", "internal_property_id", "property")
  	add_index("photos", "property")
  end
end
