class Order < ActiveRecord::Base

	belongs_to :customer
	belongs_to :sauda
	has_many :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

	before_save :generate_initial_order_details
	after_save :update_sauda_order_status
	
	def generate_initial_order_details
		
		if Order.exists?
			order = Order.order(:id).last
			self.number = "NTPLO - #{order.id + 1}"
		else
			self.number = "NTPLO - 1"
		end

		self.date = Date.today
	end

	def update_sauda_order_status
        self.sauda.is_order_taken = true
        self.sauda.save
    end

end