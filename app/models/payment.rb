class Payment < ActiveRecord::Base

	validates_presence_of :amount, :sauda_id

	belongs_to :sauda

end
