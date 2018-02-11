class Category < ActiveRecord::Base

	has_many :products
	has_many :sauda_line_items

end