class User < ActiveRecord::Base

	has_many :internal_properties

	scope :sorted, lambda { order("last_name ASC, first_name ASC") }

	 def name
    "#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end


end
