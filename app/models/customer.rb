class Customer < ActiveRecord::Base

	validates_presence_of :name, :number, :location
	validates_uniqueness_of :number

	has_many :saudas
	
end