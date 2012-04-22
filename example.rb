require './genetics.rb'

traits = []
traits << BooleanTrait.new("helpfulGeneSequenceA", 0.0015, false)
traits << BooleanTrait.new("ImmunityToHorribleDisease", 1, false)
Organism.traits = traits

Genetics.new(:max_run => 10_000_000).run