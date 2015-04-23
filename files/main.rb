require_relative './models/car'
require_relative './models/convertible'
require_relative './models/toy'
require 'term/ansicolor'

color = Term::ANSIColor

puts color.red, "Hey"
puts color.blue, "Whats"
puts color.green, "Up"

car = Car.new("Blah", :Blah)
convertible = Convertible.new("Blah", "Blah", :Blue)
toy = Toy::Convertible.new("Blah", "Blah", :Blue)

