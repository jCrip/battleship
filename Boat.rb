class Boat
	attr_accessor :type
	attr_accessor :size
	attr_accessor :sunken
	attr_accessor :parts

	@@boats = []

	def initialize(type, size)
		@type = type
		@size = size
		@sunken = false
		@parts = []
		@@boats << self
	end

	def self.all 
		@@boats 
	end

	def self.boats_left
		@@boats.select { |boat| !boat.sunken }
	end
end