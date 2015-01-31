class Photo < ActiveRecord::Base

	belongs_to :internal_property
	# mount_uploader :file_name, ImageUploader



	mount_uploader :image, ImageUploader

	scope :sorted, lambda { order("order ASC") }

	acts_as_list

end
