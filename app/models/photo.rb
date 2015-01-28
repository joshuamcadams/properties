class Photo < ActiveRecord::Base

	belongs_to :internal_properties
	mount_uploader :file_name, ImageUploader

end
