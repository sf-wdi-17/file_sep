class Car
  attr_accessor :make, :model

  def initialize(make,model)
    @make = make
    @model = model
  end

  def go_to_speed(speed)
    @speed = speed
  end
end
