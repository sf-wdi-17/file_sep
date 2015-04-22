# File Separation in Ruby (`load`, `require`, and `require_relative`)

Load & require are very similar to the purpose of `require` in Node.js

Before you start using these commands in ruby, it's important to understand what they do and how each one is different:

####`load`
  - This will reload the ruby file every time it's called.
  - Load is typically used for checking for small changes and debugging - does not keep track of whether a file or library has been loaded

####`require`

  - This will load a ruby file ONCE and only once. All subsequent require statements will not reload the file.
  - Doesn't need the .rb file extension, but won't hurt if it's there.
  - Only used to include ruby `gems` that have been installed with `gem`.
    + Don't use `require` to include your own `.rb` files (because when you wrote them, you should use `require_relative` to tell the ruby interpreter where to look for your file.)

####`require_relative`
  - Same as `require`, but will look for the specified `.rb` file *relative* to the file that is making the request.
    + That is, when you use `require_relative`, ruby will start looking for the file in the same directory as the file where you include the `require_relative` statement

### Active Learning: `require_relative` (15 mins)

1. Take 5 minutes and look at the files `car.rb` and `convertible.rb` in the `files/models/` directory. When you feel like you have a solid idea of whats going on, explain it to your buddy.
2. Take 10 minutes to create a new file `fast_car.rb` in the `files/models/` directory. In this file, build a new class `FastCar` that inherits from the `Car` class. Once you have finished writing the file, play around and verify that everything is working properly.


## Modules
There are only so many possible ways that we could name a class. What are we to do if a class name has already been taken? Like in this example...

```ruby
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

class Car
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end
```

While this example may seem completely inplausible, it's actually quite possible it could come up in an unexpected way. A more realistic way that this could come up is when using `require` or its relative counter part. Suppose I had the following:

`some_kind_of_file.rb`
```ruby
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
```
And
`car.rb`
```ruby
require_relative 'some_kind_of_file.rb'

class Car
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end
```

The 'namespace' gets polluted with multiple different implementations of the `Car` class. In ruby, we use modules to solve this namespacing issue.

`some_kind_of_file.rb`
```ruby
module Toy
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
end
```
And
`car.rb`
```ruby
require_relative 'some_kind_of_file.rb'

class Car
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end

car = Car.new("Red")
toy = Toy::Car.new("BMW", "7-Series")
```

## Gemfile's and the `bundle` command
Much like the `package.json` file that we had in node, there is a file called a `Gemfile` in ruby, where we specify all of the ruby packages (aka gems) that are project uses. The `Gemfile` should go in the root directory of your project. For example we could add a output coloring gem for ruby by doing the following.

`Gemfile`
```ruby
gem 'term-ansicolor', '~> 1.3.0'
```

then to install all of the gems, you simple run the command `bundle`.

```bash
$ bundle
```

**Note:** if you're having errors try running `gem install term-ansicolor` first.

### Once installed...
We can use the `term-ansicolor` gem in any file in our project by using `require` at the top of a file. Like so

`colors.rb`
```ruby
require 'term/ansicolor'

color = Term::ANSIColor

puts color.red, "Hey"
puts color.blue, "Whats"
puts color.green, "Up"
```

## Final exercise 10-15 minutes

In a file `main.rb` in the `files/` directory, use `require` and `require_relative` appropriately to combine the files `car.rb`, `convertible.rb`, `fast_car.rb`, and `toy.rb` into a single file. Create an instance of the `Car`, `Convertible`, `FastCar`, `Toy::Car`, and `Toy::Convertible` classes. Additionally use the `term-ansicolor` gem to color some output appropriately.


### Discussion: `load` & `require` (5 mins)

In small groups, research and discuss the differences between `require` and `require_relative`. Try to answer the following:

  - In what situations should you use `require`?
  - In what situations should you use `require_relative`?
