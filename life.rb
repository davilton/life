#!/usr/bin/env ruby
require 'byebug'

# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by over-population.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction

class Cell

	@arr = []
	attr_accessor :state, :row, :column

	def initialize(state='dead', row='', col='')
		@state = state
		@row = row
		@column = col
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

	


	# generate
	# initial_conditions
	# print_grid @arr
	# 30.times do
	# 	cycle @arr
	# 	print_grid @arr
end  ## END CLASS CELL

class Grid

	attr_accessor :cells

	def initialize
		@cells = []
	end

	def generate
		n = 10
		for r in (0..n-1)
			row = []
			for c in (0..n-1)
				row[c] = Cell.new('dead',r,c)	
			end
			cells[r] = row
		end
	end

	def initial_conditions
		cells[1][1].alive!
		cells[2][1].alive!
		cells[3][1].alive!
		cells[5][5].alive!
		cells[2][0].alive!
		cells[2][1].alive!
		cells[2][2].alive!


		# # Glider
		# cells[0][2].alive!
		# cells[1][0].alive!
		# cells[1][2].alive!
		# cells[2][1].alive!
		# cells[2][2].alive!
	end

	 

	def check cell
		cell.alive? ? 1 : 0
	end

	def north cell
		r=cell.row-1
		c=cell.column
		r >= 0 ? check(cells[r][c]) : 0
	end

	def east cell
		
		r=cell.row
		c=cell.column+1
		c < cells.size ? check(cells[r][c]) : 0
	end 

	def south cell
		r=cell.row+1
		c=cell.column
		r < cells.size ? check(cells[r][c]) : 0
	end

	def west cell
		r=cell.row
		c=cell.column-1
		c >= 0 ? check(cells[r][c]) : 0
	end

	def north_east cell
		r=cell.row-1
		c=cell.column+1
		r >= 0 && c < cells.size ? check(cells[r][c]) : 0
	end

	def south_east cell
		r=cell.row+1
		c=cell.column+1
		r < cells.size && c < cells.size ? check(cells[r][c]) : 0
	end

	def south_west cell
		r=cell.row+1
		c=cell.column-1
		r < cells.size && c >= 0 ? check(cells[r][c]) : 0
	end

	def north_west cell
		r=cell.row-1
		c=cell.column-1
		r >= 0 && c >= 0 ? check(cells[r][c]) : 0
	end

	def get_neighbors cell
		
		total = 0
		total = self.north(cell) + self.east(cell) + self.south(cell) + self.west(cell) + self.north_east(cell) + self.south_east(cell) + self.south_west(cell) + self.north_west(cell) 
	end

	def display
		cells.each do |row|
			row.each do |cell|
				if cell.alive?
					print '# '
				else
					print '  '
				end
			end
			puts ""
		end
		cells.size.times{print "=="}
		puts ""
	end

	def cycle
		kills = []
		lives = []
		cells.each do |row|
			row.each do |cell|
				n = self.get_neighbors cell
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



end

g = Grid.new
g.generate
g.initial_conditions
g.display
g.cycle
g.display