class Order < ActiveRecord::Base

	before_validation :generate_initial_order_details, :calculate_total

	validates_presence_of :number, :date, :total, :sauda_id
	validates_uniqueness_of :number

	belongs_to :sauda
	
	has_many :order_products
	has_many :products, through: :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

	def generate_initial_order_details
		if new_record?
			if Order.exists?
				order = Order.order(:id).last
				self.number = "NTPLO - #{order.id + 1}"
			else
				self.number = "NTPLO - 1"
			end

			self.date = Date.today
		end
	end

	def calculate_total
		if new_record?
			total = 0
			self.sauda.sauda_line_items.each do |sli|
				total = total + (sli.quantity * sli.rate)
			end
			self.total = total
		end
	end

end