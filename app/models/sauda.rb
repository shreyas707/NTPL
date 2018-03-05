class Sauda < ActiveRecord::Base

	validates_presence_of :number, :date, :customer_id, :is_order_taken, :is_delivered
	validates_uniqueness_of :number

	belongs_to :customer
	
	has_one :order
	has_one :delivery

	has_many :sauda_line_items
	accepts_nested_attributes_for :sauda_line_items, allow_destroy: true

	before_save :generate_initial_sauda_details

	def generate_initial_sauda_details
		
		if Sauda.exists?
			sauda = Sauda.order(:id).last
			self.number = "NTPL - #{sauda.id + 1}"
		else
			self.number = "NTPL - 1"
		end

		self.date = Date.today
	end

	def update_sauda_order()
		self.update_attributes(is_order_taken: true)
	end

end