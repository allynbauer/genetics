class Trait
  attr_reader :name, :chance, :value

  def initialize(name, chance, value)
    @name = name
    @chance = chance
    @value = value
  end

  def to_s
    "<Trait:#{name} #{chance}% value=#{value}>"
  end

  def applyFactor(f)
    raise "implement"
  end

  def mutate
    raise "implement"
  end
end

class BooleanTrait < Trait
  def applyFactor(f)
    f.boolean(self.value)
  end

  def mutate
    if @chance.percentChance
      @value = true
    end
  end

end