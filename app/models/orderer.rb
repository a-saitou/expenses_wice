class Orderer < ActiveRecord::Base
	has_many :agreements , foreign_key: 'orderer_id'
end
