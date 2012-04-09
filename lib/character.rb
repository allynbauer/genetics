include Comparable

class Character
  def self.traits=(traits)
    @@traits = traits
  end

  attr_reader :traits

  def initialize(traits = nil)
    traits = @@traits if traits.nil?
    @traits = traits
  end

  def self.seed!
    return self.new
  end

  def evolutionaryUtilityMeasurement
    Factor.weigh(@traits)
  end

  def mutate
    @traits.each do |trait|
      trait.mutate
    end
    self
  end

  def clone
    return Character.new(@traits)
  end

  def to_s
    "Character: " + @traits.collect { |t| "#{t}}" }.join(", ")
  end
end