FactoryGirl.define do
	
	factory :target, class: Cell do
		state 'alive'
		row 1
		column 1
	end

	factory :north, class: Cell do
		state 'alive'
		row 0
		column 1 
	end


end