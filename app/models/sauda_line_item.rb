class SaudaLineItem < ActiveRecord::Base

	belongs_to :sauda
	belongs_to :category

end