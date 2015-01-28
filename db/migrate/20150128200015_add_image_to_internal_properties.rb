class AddImageToInternalProperties < ActiveRecord::Migration
  def change
    add_column :internal_properties, :image, :string
  end
end
