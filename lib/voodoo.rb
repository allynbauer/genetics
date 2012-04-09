require 'pp'

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