require './spec_helper'
require	'../life'
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
			north = build(:north),
			south = build(:south),
			east = build(:east),
			west = build(:west)
		]
		neighbors.each do |n|
			@grid.cells[n.row][n.column] = n
		end
		byebug
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
end