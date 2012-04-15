require './genetics.rb'
require './boolean_trait.rb'

traits = []
traits << BooleanTrait.new("helpfulGeneSequenceA", 1.0, false)
traits << BooleanTrait.new("ImmunityToHorribleDisease", 1.0, false)
Organism.traits = traits
Genetics.new(:max_run => 10_000_000).run