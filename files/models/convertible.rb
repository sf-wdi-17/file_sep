require_relative 'car.rb'

class Convertible < Car
  attr_reader :color

  def initialize(make,model,color)
    super(make,model)
    @color = color
    @open = false
  end

  def convert
    @open = !@open
  end

  def go_to_speed(speed)
    puts "Top coming down"
    convert
    seats("I'm have cushion")
    super(speed)
  end
end
