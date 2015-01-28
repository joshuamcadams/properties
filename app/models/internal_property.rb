class InternalProperty < ActiveRecord::Base
	belongs_to :users
	has_many   :photos

	mount_uploader :image, ImageUploader

	scope :sorted, lambda { order("name ASC") }

end
