require 'test_helper'

module KanbanBoard
  class MemberTest < ActiveSupport::TestCase
    
    def setup
      @user = KanbanBoard.user_class.create(first_name: "Stephan", last_name: "Griessner")
      @project = Project.create(name: "First project", description: "Project for testing", finishing_date: Date.today)
      @member2 = Member.new(project: @project, user: @user, user_role: 'admin')
      @member = Member.new
		end

    def teardown
      KanbanBoard.user_class.destroy_all
      Project.destroy_all
      Member.destroy_all
    end

    # validations
    test "member must not be empty" do
      assert_not @member.save, 'member should not be saved'
      assert @member.errors.any?, 'errors should be thrown'
    end

    test 'presence of project' do
      assert @member.invalid?
      assert @member.errors[:project].any?, 'project is not given, error should be thrown'

      assert @member2.valid?
      assert_not @member2.errors[:project].any?, 'project given, should not throw error'
    end

    test 'presence of user' do
      assert @member.invalid?
      assert @member.errors[:user].any?, 'user is not given, error should be thrown'

      assert @member2.valid?
      assert_not @member2.errors[:user].any?, 'user given, should not throw error'
    end

    test 'presence of user_role' do
      assert @member.invalid?
      assert @member.errors[:user_role].any?, 'user_role is not given, error should be thrown'

      assert @member2.valid?
      assert_not @member2.errors[:user_role].any?, 'user_role given, should not throw error'
    end

    test 'unpermitted user_role' do
    	%w(guest designer).each do |bad_value|
    		@member2.user_role = bad_value
    		assert_not @member2.valid?, "user_role #{bad_value} should not be valid"
    	end
    end

    test 'valid user_role' do
    	Member.roles.each do |value|
    		@member2.user_role = value
    		assert @member2.valid?, "user_role #{value} should be valid"
    	end
    end

    # alias attributes
    test "alias attribute for user_role" do
      assert_equal @member2.role, @member2.user_role, 'role should be equal user_role'
    end

  end
end
