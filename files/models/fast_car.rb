require_relative 'convertible'

class FastCar < Convertible
	attr_accessor :going_fast

	def go_to_speed(speed)
		if speed > 1000
			puts "I'm going German highway fast"
			@going_fast = true
			super(1000)
		else
			super(speed)
		end
	end
end