class NilTrait
  class << self
    def mutate!(traits)
      traits.each do |trait|
        if block_given?
          context = yield(trait)
        end
        trait.mutate!
      end
      traits
    end
  
    def evalulate(traits)
      factors = traits.collect do |trait|
        trait.factor
      end
      factors.inject(0.0) { |sum, num| sum + num } / traits.size
    end
  end
  
  attr_reader :name, :chance

  def initialize(name = "NilTrait", chance = 0.0)
    @name = name
    @chance = chance
  end

  def to_s
    "<#{self.class}:#{name} #{chance}%>"
  end

  def factor
    0.0
  end

  def mutate!
  end
end
