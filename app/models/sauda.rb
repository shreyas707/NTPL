class Sauda < ActiveRecord::Base

	validates_presence_of :number, :date, :customer_id
	validates_uniqueness_of :number

	belongs_to :customer
	
	has_one :order
	has_one :delivery

	has_many :payments
	
	has_many :sauda_line_items
	accepts_nested_attributes_for :sauda_line_items, allow_destroy: true

	before_validation :generate_initial_sauda_details

	def generate_initial_sauda_details
		if new_record?
			if Sauda.exists?
				sauda = Sauda.order(:id).last
				self.number = "NTPL - #{sauda.id + 1}"
			else
				self.number = "NTPL - 1"
			end

			self.date = Date.today
		end
	end

end