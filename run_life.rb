#!/usr/bin/env ruby

require './life'

grid = Grid.new
if ARGV.size == 0
	grid.start_game	
elsif ARGV.size == 2
	size = ARGV[0]
	generations = ARGV[1]
	grid.start_game(size: size.to_i, generations: generations.to_i)
elsif ARGV.size == 3
  positions = []
  File.open(ARGV[2], 'r').each_line do |line|
    positions << line.split(',').map(&:to_i)
  end
  size = ARGV[0]
  generations = ARGV[1]
  grid.start_game(size: size.to_i, generations: generations.to_i, initial_conditions: positions) 
end
