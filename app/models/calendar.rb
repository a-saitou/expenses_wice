class Calendar < ActiveRecord::Base
	has_many :works, foreign_key: 'callendar_id'
end
