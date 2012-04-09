class Factor

  attr_reader :weight, :value

  def initialize(weight)
    @weight = weight
    @value = 0
  end

  def boolean(b)
    @value += (1.0 / @weight) * (b ? 1 : 0)
  end

  def self.weight(weight)
    factor = self.new(weight)
    yield(factor)
    factor.value
  end

  def self.weigh(traits)
    Factor.weight(traits.size) do |f|
      traits.each do |trait|
        trait.applyFactor(f)
      end
    end
  end
end