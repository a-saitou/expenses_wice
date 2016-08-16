class Agreement < ActiveRecord::Base
    has_many :works ,foreign_key: 'agreement_id'
    
	belongs_to :orderer
end
