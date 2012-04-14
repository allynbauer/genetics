$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'voodoo.rb'
require 'organism.rb'
require 'trait.rb'
require 'pp'


class Genetics
  def initialize(opts = { :max_run => nil })
    @max_run = opts[:max_run].nil? ? 0 : opts[:max_run]
  end

  def run
    obj = Organism.seed!
    objs = []
    count = 0
    lastReplacementAtCount = 0
    loop do 
      count += 1
      newObj = obj.clone.mutate
      #puts "#{newObj} > #{obj}"
      if newObj.fitness > obj.fitness
        obj = newObj
        difference = count - lastReplacementAtCount
        puts "New base: #{obj} at cycle:#{count} - cycles since replacement #{difference}"
        lastReplacementAtCount = count
      elsif newObj.fitness == obj.fitness
        # todo: add to objs and have it random pick
      end

      if newObj.fitness === 1
        puts "We have a winner: #{obj} in #{count} cycles"
        exit
      elsif @max_run != 0 && @max_run <= count
        puts "Max run count reached. best: #{obj} in #{count} cycles"
        exit
      elsif count % 1_000_000 == 0
        puts "COUNT: #{count}"
      end

    end
  end
end
