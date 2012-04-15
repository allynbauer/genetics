# create a trait for a boolean value
class BooleanTrait < NilTrait
  attr_reader :boolean_value
  
  def initialize(name, chance, boolean_value)
    super(name, chance)
    @boolean_value = boolean_value
  end
  
  def factor
    @boolean_value ? 1.0 : 0.0
  end

  def mutate!
    if @chance.percentChance
      @boolean_value = !@boolean_value
    end
  end

end