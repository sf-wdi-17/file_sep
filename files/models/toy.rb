module Toy
  class Car
    attr_accessor :make, :model

    def initialize(make,model)
      @make = make
      @model = model
    end
  end

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
  end
end
