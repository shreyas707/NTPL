class Order < ActiveRecord::Base

	validates_presence_of :number, :date, :total, :sauda_id
	validates_uniqueness_of :number

	belongs_to :sauda
	
	has_many :order_products
	has_many :products, through: :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

	before_save :generate_initial_order_details, :calculate_total
	# after_create :update_sauda_order_status
	
	def generate_initial_order_details	
		if Order.exists?
			order = Order.order(:id).last
			self.number = "NTPLO - #{order.id + 1}"
		else
			self.number = "NTPLO - 1"
		end

		self.date = Date.today
	end

	def calculate_total
		total = 0
		self.sauda.sauda_line_items.each do |sli|
			total = total + (sli.quantity * sli.rate)
		end
		self.total = total
	end

	# def update_sauda_order_status
 #        self.sauda.is_order_taken = true
 #    end

end