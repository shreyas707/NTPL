class SaudaLineItem < ActiveRecord::Base

	validates_presence_of :category_id, :rate, :quantity, :sauda_id

	belongs_to :sauda
	belongs_to :category

end