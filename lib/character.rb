include Comparable

class Character
  attr_reader :isWinning

  def initialize(isWinning = false, extraWinning = false)
    @isWinning = isWinning
    @extraWinning = extraWinning
  end

  def self.seed!
    return self.new
  end

  def evolutionaryUtilityMeasurement
    Factor.weight = 2
    factor = 0
    factor += Factor.boolean(@isWinning)
    factor += Factor.boolean(@extraWinning)
    factor
  end

  def mutate
    if 0.1.percentChance
      @isWinning = true
    end
    if 0.01.percentChance
      @extraWinning = true
    end
    self
  end

  def clone
    return Character.new(@isWinning)
  end

  def to_s
    "#{@isWinning} && #{@extraWinning}"
  end
end