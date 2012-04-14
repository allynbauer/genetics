require './genetics.rb'

class Size
  attr_reader :width, :height
  
  def initialize(:params = {})
    @width = params[:width]
    @height = params[:height]
    
    size = params[:size]
    unless size.nil?
      @width = size
      @height = size
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
plants << Plant.new("Astlbe", Color::Pink)
plants << Plant.new("Lily of the Valley", Color::White)
plants << Plant.new("Rose", Color::Any)
plants << Plant.new("Zinnia", Color::Any)
plants << Plant.new("Hydrangea", [Color::Pink, Color::White])
plants << Plant.new("Coreopsis", Color::Yellow)


patch_traits = []
patch_traits << PatchTrait

garden_size = Size.new(:width => 10.0, :height => 10.0)
Organism.traits = [] << GardenTrait.new("Garden", 100, garden_size, patch_traits)

Genetics.new(:max_run => 10_000_000).run