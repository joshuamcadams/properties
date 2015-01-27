class AlterInternalProperty < ActiveRecord::Migration
  def up
  	remove_index("internal_properties", "agent")
  	rename_column("internal_properties", "agent", "user_id")
  	add_index("internal_properties", "user_id")
  end

  def down
  	remove_index("internal_properties", "user_id")
  	rename_column("internal_properties", "user_id", "agent")
  	add_index("internal_properties", "agent")
  end
end
