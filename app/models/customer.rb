class Customer < ActiveRecord::Base

	validates_presence_of :name, :number, :location

	has_many :saudas
	
end