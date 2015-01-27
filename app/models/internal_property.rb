class InternalProperty < ActiveRecord::Base
	belongs_to :users
	has_many   :photos
end
