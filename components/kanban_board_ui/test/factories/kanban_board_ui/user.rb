module KanbanBoardUi
	FactoryGirl.define do
		factory :user, class: User do
			email 'sgriessner@fh-salzburg.ac.at'
			password '12345678'
			password_confirmation '12345678'
			first_name 'Stephan'
			last_name 'Griessner'
		end
	end
end