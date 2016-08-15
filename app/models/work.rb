class Work < ActiveRecord::Base

	belongs_to :staff
	belongs_to :calendar
	belongs_to :agreement	
end
