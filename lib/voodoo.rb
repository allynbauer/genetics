require 'pp'

class Factor

  attr_reader :weight, :value

  def initialize(weight)
    @weight = weight
    @value = 0
  end

  def boolean(b)
    @value += (1.0 / @weight) * (b ? 1 : -1)
  end

  def self.weight(weight)
    factor = self.new(weight)
    yield(factor)
    factor.value
  end
end

module NumberAdditions
  def percentChance
    percent = [self, 100].min.to_f / 100
    r = rand
    return r <= percent
  end
end

class Integer
  include NumberAdditions
end

class Float
  include NumberAdditions
end