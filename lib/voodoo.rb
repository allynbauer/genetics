require 'pp'

class Factor
  def self.weight=(weight)
    @@weight = weight
  end

  def self.boolean(b)
    b ? 0.5 : -0.5
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