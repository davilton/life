#!/usr/bin/env ruby

require './life'

grid = Grid.new
if ARGV.length == 0
	grid.start_game	
elsif ARGV.length == 2
	size = ARGV[0]
	generations = ARGV[1]
	grid.start_game(size: size.to_i, generations: generations.to_i)
end