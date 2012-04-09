$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'voodoo.rb'
require 'factor.rb'
require 'character.rb'
require 'trait.rb'
require 'pp'


class Genetics
  def run
    obj = Character.seed!
    objs = []
    count = 0
    lastReplacementAtCount = 0
    loop do 
      count += 1
      newObj = obj.clone.mutate
      puts newObj.evolutionaryUtilityMeasurement
      #puts "#{newObj} > #{obj}"
      if newObj.evolutionaryUtilityMeasurement > obj.evolutionaryUtilityMeasurement
        obj = newObj
        difference = count - lastReplacementAtCount
        puts "New base: #{obj} at cycle:#{count} - cycles since replacement #{difference}"
        lastReplacementAtCount = count
      elsif newObj.evolutionaryUtilityMeasurement == obj.evolutionaryUtilityMeasurement
        # todo: add to objs and have it random pick
      end

      if newObj.evolutionaryUtilityMeasurement === 1
        puts "We have a winner: #{obj} in #{count} cycles"
        exit
      elsif count % 1_000_000 == 0
        puts "COUNT: #{count}"
      end

    end
  end
end
