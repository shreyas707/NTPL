class Product < ActiveRecord::Base

	belongs_to :category
	has_many :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

end