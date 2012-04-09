include Comparable

class Organism
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

  def fitness
    Factor.weigh(@traits)
  end

  def mutate
    @traits.each do |trait|
      trait.mutate
    end
    self
  end

  def clone
    return self.class.new(Marshal.load(Marshal.dump(@traits)))
  end

  def to_s
    "#{self.class} fitness:#{self.fitness} traits: " + @traits.collect { |t| "#{t}}" }.join(", ")
  end
end