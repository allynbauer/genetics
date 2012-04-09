require './genetics.rb'
traits = []

traits << BooleanTrait.new("helpfulGeneSequenceA", 1, false)
traits << BooleanTrait.new("ImmunityToHorribleDisease", 1, false)

Character.traits = traits
Genetics.new.run