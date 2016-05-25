require 'test_helper'

module KanbanUser
  class UserTest < ActiveSupport::TestCase
    def setup
    	@user2 = User.create(email: 'sgriessner@fh-salzburg.ac.at', encrypted_password: '12345678', first_name: 'Stephan', last_name: 'Griessner')
    	@user = User.new
    end

    def teardown
    	User.destroy_all
    end

    test "must give full name" do
    	assert_equal "Stephan Griessner", @user2.full_name, 'should get users full name'
    end
  end
end
