class Part
	attr_accessor :pos_x
	attr_accessor :pos_y
	attr_accessor :hit 

	def initialize(x, y)
		@pos_x = x 
		@pos_y = y 
		@hit = false
	end
end