class Product < ActiveRecord::Base

	validates_presence_of :size, :category_id

	belongs_to :category
	
	has_many :order_products
	has_many :orders, through: :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

end