#!/usr/bin/env ruby
require 'byebug'

# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by over-population.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
class Cell

	@arr = []
	attr_accessor :state, :row, :column

	def initialize(state='dead', row='', col='')
		@state = state
		@row = row
		@column = col
	end

	def self.initial_conditions
		# @arr[1][1].alive!
		# @arr[2][1].alive!
		# @arr[3][1].alive!
		# @arr[5][5].alive!
		# @arr[2][0].alive!
		# @arr[2][1].alive!
		# @arr[2][2].alive!


		## Glider
		@arr[0][2].alive!
		@arr[1][0].alive!
		@arr[1][2].alive!
		@arr[2][1].alive!
		@arr[2][2].alive!
	end

	def self.generate
		n = 10
		for r in (0..n-1)
			row = []
			for c in (0..n-1)
				row[c] = Cell.new('dead',r,c)	
			end
			@arr[r] = row
		end
	end

	def alive!
		self.state = 'alive'
	end

	def kill!
		self.state = 'dead'
	end

	def alive?
		state == 'alive' ? true : false
	end

	def check
		alive? ? 1 : 0
	end

	def self.north cell
		r=cell.row-1
		c=cell.column
		r >= 0 ? @arr[r][c].check : 0
	end

	def self.east cell
		r=cell.row
		c=cell.column+1
		c < @arr.size ? @arr[r][c].check : 0
	end 

	def self.south cell
		r=cell.row+1
		c=cell.column
		r < @arr.size ? @arr[r][c].check : 0
	end

	def self.west cell
		r=cell.row
		c=cell.column-1
		c >= 0 ? @arr[r][c].check : 0
	end

	def self.north_east cell
		r=cell.row-1
		c=cell.column+1
		r >= 0 && c < @arr.size ? @arr[r][c].check : 0
	end

	def self.south_east cell
		r=cell.row+1
		c=cell.column+1
		r < @arr.size && c < @arr.size ? @arr[r][c].check : 0
	end

	def self.south_west cell
		r=cell.row+1
		c=cell.column-1
		r < @arr.size && c >= 0 ? @arr[r][c].check : 0
	end

	def self.north_west cell
		r=cell.row-1
		c=cell.column-1
		r >= 0 && c >= 0 ? @arr[r][c].check : 0
	end

	def self.get_neighbors cell
		total = 0
		total = north(cell) + east(cell) + south(cell) + west(cell) + north_east(cell) + south_east(cell) + south_west(cell) + north_west(cell) 
	end

	def self.print_grid array
		array.each do |row|
			row.each do |cell|
				if cell.alive?
					print '# '
				else
					print '  '
				end
			end
			puts ""
		end
		@arr.size.times{print "=="}
		puts ""
	end

	def self.cycle cells
		kills = []
		lives = []
		cells.each do |row|
			row.each do |cell|
				n = get_neighbors cell
				if n < 2
					kills << cell
				elsif n == 3
					lives << cell
				elsif n.between?(2,3)
					# lives
				elsif n > 3
					kills << cell
				end
			end
		end
		kills.each{|c| c.kill!}
		lives.each{|c| c.alive!}
	end


	generate
	initial_conditions
	print_grid @arr
	30.times do
		cycle @arr
		print_grid @arr
	end
end