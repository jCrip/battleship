require 'pp'

require_relative 'Grid.rb'
require_relative 'Part.rb'
require_relative 'Boat.rb'
require_relative 'Bomba.rb'

$fin = false
$vidas = 1

#Inicializa juego
grid_enemigo = Grid.new

b = Boat.new("Carrier", 5)
b.parts << Part.new(1,0)
b.parts << Part.new(1,1)
b.parts << Part.new(1,2)
b.parts << Part.new(1,3)
b.parts << Part.new(1,4)

b = Boat.new("Battleship", 4)
b.parts << Part.new(3,3)
b.parts << Part.new(3,4)
b.parts << Part.new(3,5)
b.parts << Part.new(3,6)

b = Boat.new("Cruiser", 3)
b.parts << Part.new(5,4)
b.parts << Part.new(6,4)
b.parts << Part.new(7,4)

b = Boat.new("Submarine", 3)
b.parts << Part.new(6,2)
b.parts << Part.new(5,2)
b.parts << Part.new(4,2)

b = Boat.new("Destroyer", 2)
b.parts << Part.new(5,0)
b.parts << Part.new(5,1)

Bomba.new(7,7)

grid_enemigo.posiciona(Boat.all, "Boat")
grid_enemigo.posiciona(Bomba.all, "Bomb")

while (!$fin)
	puts "Teclee 'a' para atacar, m' para ver el mapa, 'b' para ver barcos sobrevivientes, 'q' para salir:"
	input = gets.chomp

	case input
	when "a"
		puts "Teclee coordenada 'x', seguida por coordenada 'y' (0-7):"
		x = gets.chomp.to_i
		y = gets.chomp.to_i 
		puts "Has atacado a (#{x}, #{y})!"
		grid_enemigo.ataca(x,y)
	when "m"
		pp grid_enemigo
	when "q"
		puts "Fin de juego."
		$fin = true
	when "b"
		boats = Boat.boats_left
		boats.each do |b|
			puts b.type
		end
	else
		puts "Error de entrada."
	end
end