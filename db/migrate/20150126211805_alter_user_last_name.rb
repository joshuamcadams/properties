class AlterUserLastName < ActiveRecord::Migration
  def up 
  	change_column("users", "last_name", :string, :limit => 50)
  end

  def down 
  	change_column("users", "last_name", :string, :limit => 5)
  end
end
