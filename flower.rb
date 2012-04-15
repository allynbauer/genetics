require './genetics.rb'

class Color
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def to_s
    "<Color #{@name}"
  end
  
  Red = Color.new("Red")
  Orange = Color.new("Orange")
  Yellow = Color.new("Yellow")
  Green = Color.new("Green")
  Blue = Color.new("Blue")
  Purple = Color.new("Purple")
  White = Color.new("White")
  Pink = Color.new("Pink")
  Any = [Pink, Red, Orange, Yellow, Green, Blue, Purple, White]
  
  def self.random
    Any[rand(Any.length)]
  end
end

class Size
  attr_reader :width, :height
  
  def initialize(params = {})
    @width = params[:width]
    @height = params[:height]
    
    side = params[:side]
    unless side.nil?
      @width = side
      @height = side
    end
  end
end

class Plant
  attr_reader :name, :color, :sunlight_desire, :growing_size
  
  def initialize(name, color, sunlight_desire, growing_size)
    @name = name
    @color = color.to_a
    @sunlight_desire = sunlight_desire
    @optimal_temperature = optimal_temperature
    @growing_size = growing_size
  end
end

class GardenPatch
  attr_reader :plant
  
  def initialize(plant)
    @plant = plant
  end
end

class PlantTrait < NilTrait
  def factor(size)
  end
  
  def mutate!
  end
end

class PatchTrait < NilTrait
  
  def factor
  end
  
  def mutate!
  end
end

# meta trait
class GardenTrait < NilTrait
  attr_accessor :size, :patch_traits
  
  def initialize(name, chance, size, patch_traits)
    super
    @size = size
    @patch_traits = patch_traits
  end
  
  def factor
    NilTrait.evalulate(@value)
  end

  def mutate!
    sizes = []
    
    NilTrait.mutate(@patch_traits) do |patch_trait|
      sizes.shift
    end
  end
end

plants = []
plants << Plant.new("Astlbe", Color::Pink, "shade", Size.new(:side => 0.6))
plants << Plant.new("Lily of the Valley", Color::White, "shade", Size.new(:side => 0.3))
plants << Plant.new("Rose", Color::Any, "sun", Size.new(:side => 1.0))
plants << Plant.new("Zinnia", Color::Any, "sun", Size.new(:side => 0.5))
plants << Plant.new("Hydrangea", [Color::Pink, Color::White], "part shade", Size.new(:side => 0.6))
plants << Plant.new("Coreopsis", Color::Yellow, "sun", Size.new(:side => 1.0))

patch_traits = []
patch_traits << PatchTrait

Organism.traits = [] << GardenTrait.new("Garden", 100, Size.new(:width => 10.0, :height => 10.0), patch_traits)

Genetics.new(:max_run => 10_000_000).run