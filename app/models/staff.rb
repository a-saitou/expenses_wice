class Staff < ActiveRecord::Base
	has_many :works , foreign_key: 'staff_id'
end
