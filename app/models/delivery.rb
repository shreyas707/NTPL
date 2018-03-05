class Delivery < ActiveRecord::Base

	validates_presence_of :number, :date, :total, :sauda_id
	validates_uniqueness_of :number

	belongs_to :sauda

	has_many :delivery_products
	has_many :products, through: :delivery_products
	accepts_nested_attributes_for :delivery_products, allow_destroy: true

	before_save :generate_initial_delivery_details

	def generate_initial_delivery_details	
		if Delivery.exists?
			delivery = Delivery.order(:id).last
			self.number = "NTPLO - #{delivery.id + 1}"
		else
			self.number = "NTPLO - 1"
		end

		self.date = Date.today
	end

end