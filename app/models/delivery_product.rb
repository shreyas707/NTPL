class DeliveryProduct < ActiveRecord::Base

	# validates_presence_of :delivery_id, :product_id, :delivery_quantity, :price

	belongs_to :delivery
	belongs_to :product

end