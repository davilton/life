require_relative 'spec_helper'
require_relative	'../life'
require 'byebug'

describe Grid do
	
	before :all do
		@target = build(:target)
		@grid = build(:grid)
		@grid.cells[@target.row][@target.column] = @target
	end

	it 'checks if a cell is alive' do
		nbr = build(:north)
		expect(@grid.check(nbr)).to eq(1)
	end

	it 'returns the number of neighbors' do
		neighbors = [
			build(:north),
			build(:south),
			build(:east),
			build(:west)
		]
		neighbors.each do |n|
			@grid.cells[n.row][n.column] = n
		end
		expect(@grid.get_neighbors(@target)).to eq(4)
	end

	it 'has a neighbor to the north' do
		nbr = build(:north)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.north(@target)).to eq(1)
	end
	
	it 'has a neighbor to the east' do
		nbr = build(:east)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.east(@target)).to eq(1)
	end

	it 'has a neighbor to the south' do
		nbr = build(:south)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.south(@target)).to eq(1)
	end

	it 'has a neighbor to the west' do
		nbr = build(:west)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.west(@target)).to eq(1)
	end

	it 'has a neighbor to the northeast' do
		nbr = build(:northeast)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.northeast(@target)).to eq(1)
	end

	it 'has a neighbor to the southeast' do
		nbr = build(:southeast)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.southeast(@target)).to eq(1)
	end

	it 'has a neighbor to the southwest' do
		nbr = build(:southwest)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.southwest(@target)).to eq(1)
	end

	it 'has a neighbor to the northwest' do
		nbr = build(:northwest)
		@grid.cells[nbr.row][nbr.column] = nbr
		expect(@grid.northwest(@target)).to eq(1)
	end

	it 'generates all of the cells' do
		expect(@grid.generate(15).size).to eq(15)
	end

	it 'kills a cell with too many neighbors' do
		# target is alive and has 4 neighbors, it should die next gen
		@grid.cycle												  
		@target = @grid.cells[1][1]
		expect(@target.alive?).to be(false) # dead
	end

	it 'produces a cell with exactly 3 neighbors' do
		@target.kill! 						# target is dead
		@grid.cells[1][0].kill!		# kill one neighbor
		# 3 alive neighbors
		@grid.cells[0][1].alive!	
		@grid.cells[1][2].alive!
		@grid.cells[2][1].alive!
		@grid.cycle								
		@target = @grid.cells[1][1]			
		expect(@target.alive?).to be(true)
	end
end
