FactoryGirl.define do
	
	factory :grid, class: Grid do
		cells [[],[],[],[],[],[],[],[],[]]
	end

	factory :target, class: Cell do
		state 'alive'
		row 1
		column 1
		initialize_with { new(state)}
	end

	factory :north, class: Cell do
		state 'alive'
		row 0
		column 1 
		initialize_with { new(state)}
	end

	factory :east, class: Cell do
		state 'alive'
		row 1
		column 2 
		initialize_with { new(state)}
	end
	factory :south, class: Cell do
		state 'alive'
		row 2
		column 1 
		initialize_with { new(state)}
	end
	factory :west, class: Cell do
		state 'alive'
		row 1
		column 0 
		initialize_with { new(state)}
	end
	factory :northeast, class: Cell do
		state 'alive'
		row 0
		column 2 
		initialize_with { new(state)}
	end
	factory :southeast, class: Cell do
		state 'alive'
		row 2
		column 2 
		initialize_with { new(state)}
	end
	factory :southwest, class: Cell do
		state 'alive'
		row 2
		column 0 
		initialize_with { new(state)}
	end
	factory :northwest, class: Cell do
		state 'alive'
		row 0
		column 0 
		initialize_with { new(state)}
	end

end