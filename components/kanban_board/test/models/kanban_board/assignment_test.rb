require 'test_helper'

module KanbanBoard
  class AssignmentTest < ActiveSupport::TestCase

 		def setup
      @user = KanbanBoard.user_class.create(first_name: "Stephan", last_name: "Griessner")
      @task = KanbanBoard.card_class.create(title: "First Task", description: "Task for testing", deadline: Date.today)
      @project = Project.create(name: "First project", description: "Project for testing", finishing_date: Date.today)
      @assignment2 = Assignment.new(project: @project, task: @task)
      @assignment = Assignment.new
		end

    def teardown
      KanbanBoard.user_class.destroy_all
      KanbanBoard.card_class.destroy_all
      Project.destroy_all
      Assignment.destroy_all
    end

    # validations
    test "assignment must not be empty" do
      assert_not @assignment.save, 'assignment should not be saved'
      assert @assignment.errors.any?, 'errors should be thrown'
    end

    test 'presence of project' do
      assert @assignment.invalid?
      assert @assignment.errors[:project].any?, 'project is not given, error should be thrown'

      assert @assignment2.valid?
      assert_not @assignment2.errors[:project].any?, 'project given, should not throw error'
    end

    test 'presence of task' do
      assert @assignment.invalid?
      assert @assignment.errors[:task].any?, 'task is not given, error should be thrown'

      assert @assignment2.valid?
      assert_not @assignment2.errors[:task].any?, 'task given, should not throw error'
    end

    test 'presence of user on update' do
      assert @assignment2.save
      assert_not @assignment2.errors[:user].any?, 'user not given, error should not be thrown'

      @assignment2.update(user: @user)
      assert_not @assignment2.errors[:user].any?, 'user is given, error should not be thrown'
    end

    test 'add first status to assignment on create' do
      assert @assignment2.save
      assert_not @assignment2.errors[:status].any?, 'status should be created, error should not be thrown'
      assert_equal KanbanBoard.states.first, @assignment2.status, 'status should be backlog'
    end
  end
end
