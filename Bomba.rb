class Bomba
	attr_accessor :pos_x
	attr_accessor :pos_y
	attr_accessor :explotada

	@@bombas = []

	def initialize(x, y)
		@pos_x = x 
		@pos_y = y 
		@explotada = false
		@@bombas << self 
	end

	def self.all 
		@@bombas
	end
end