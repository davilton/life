require './spec_helper'
require	'../life'
require 'byebug'

describe Cell do
	


	before :each do
		byebug
		@arr = []
		@target = build(:target)
		@arr[@target.row][@target.column] = @target
	end

	it 'has a neighbor to the north' do
		n = build(:north)
		@arr[n.row][n.column] = n
		expect(Cell.north(@target)).to eq(1)
	end
	
	it 'has a neighbor to the east' do
		
	end

	it 'has a neighbor to the south' do
		
	end

	it 'has a neighbor to the west' do
		
	end

	it 'has a neighbor to the northeast' do
		
	end

	it 'has a neighbor to the southeast' do
		
	end

	it 'has a neighbor to the southwest' do
		
	end

	it 'has a neighbor to the northwest' do
		
	end







end