class Grid
	attr_accessor :map 

	def initialize
		@map = [
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"],
			["-","-","-","-","-","-","-","-"]
		]
	end

	def posiciona(objetos, tipo)
		if tipo == "Boat"
			objetos.each do |b|
				b.parts.each do |p|
					self.map[p.pos_y][p.pos_x] = "B"
				end
			end
		elsif tipo == "Bomb" 
			objetos.each do |b|
				self.map[b.pos_y][b.pos_x] = "v"
			end
		end
	end

	def ataca(x,y)
		case @map[y][x]
		when "-"
			puts "Fallaste!"
			@map[y][x] = "m" 
		when "B"
			Boat.all.each do |b|
				b.parts.each do |p|
					if p.pos_x == x && p.pos_y == y
						puts "HIT! Le diste a #{b.type}!"
						p.hit = true
						@map[y][x] = "*"
						sank = true
						b.parts.each do |ps|
							sank = false unless ps.hit 
						end
						if sank
							b.sunken = true
							#Codigo de Ganaste
							if Boat.boats_left.count == 0
								puts "Ganaste. Felicidades!"
								$fin = true
								break
							end
						end
					end
				end
			end
		when "v"
			@map[y][x] = "."
			$vidas = $vidas - 1
			if $vidas == 0
				puts "Perdiste, se acabaron tus vidas!"
				$fin = true
			end
		end
	end
end