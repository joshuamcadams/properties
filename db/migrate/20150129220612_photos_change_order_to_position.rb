class PhotosChangeOrderToPosition < ActiveRecord::Migration
  def up 
  	rename_column("photos", "order", "position")
  end

  def down 
  	rename_column("photos", "position", "order")
  end
end
