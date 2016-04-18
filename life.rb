require 'curses'
require 'byebug'

## Any live cell with fewer than two live neighbours dies, as if caused by under-population.
## Any live cell with two or three live neighbours lives on to the next generation.
## Any live cell with more than three live neighbours dies, as if by over-population.
## Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction

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
end  ## END CLASS CELL

class Grid
	include Curses

	attr_accessor :cells

	def initialize
		@cells = []
	end

	def generate(size)
		!size.nil? && size>=5 ? n=size : n=15
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
		cells[4][4].alive!
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

	def start_game(options = {})
		generate(options[:size])
		initial_conditions
		num = options[:generations] || 30
		num.times do
			cycle
			display
		end
	end

	def check cell
		return 0 if cell.nil?
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

	def northeast cell
		r=cell.row-1
		c=cell.column+1
		r >= 0 && c < cells.size ? check(cells[r][c]) : 0
	end

	def southeast cell
		r=cell.row+1
		c=cell.column+1
		r < cells.size && c < cells.size ? check(cells[r][c]) : 0
	end

	def southwest cell
		r=cell.row+1
		c=cell.column-1
		r < cells.size && c >= 0 ? check(cells[r][c]) : 0
	end

	def northwest cell
		r=cell.row-1
		c=cell.column-1
		r >= 0 && c >= 0 ? check(cells[r][c]) : 0
	end

	def get_neighbors cell
		total = 0
		total = self.north(cell) + self.east(cell) + self.south(cell) + self.west(cell) + self.northeast(cell) + self.southeast(cell) + self.southwest(cell) + self.northwest(cell) 
	end

	def display
		init_screen
		setpos(0,0)
		cells.each do |row|
			row.each do |cell|
				if cell.alive?
					addstr '# '
					refresh
				else
					addstr '  '
					refresh
				end
			end
			addstr "\n"
			refresh
		end
		sleep 0.5
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
					# No Change
				elsif n > 3
					kills << cell
				end
			end
		end
		kills.each{|c| c.kill!}
		lives.each{|c| c.alive!}
	end
end  ## END CLASS GRID

