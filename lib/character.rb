include Comparable

class Character
  attr_reader :isWinning, :extraWinning

  def initialize(isWinning = false, extraWinning = false)
    @isWinning = isWinning
    @extraWinning = extraWinning
  end

  def self.seed!
    return self.new
  end

  def evolutionaryUtilityMeasurement
    Factor.weight(2) do |f|
      f.boolean(@isWinning)
      f.boolean(@extraWinning)
    end
  end

  def mutate
    if 1.percentChance
      @isWinning = true
    end
    if 1.percentChance
      @extraWinning = true
    end
    self
  end

  def clone
    return Character.new(@isWinning, extraWinning)
  end

  def to_s
    "#{@isWinning} && #{@extraWinning}"
  end
end