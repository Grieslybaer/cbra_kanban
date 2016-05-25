require 'test_helper'

module KanbanCard
  class TaskTest < ActiveSupport::TestCase

    def setup
    	@task2 = Task.create(name: 'Test', description: 'Test description', finishing_date: Date.today)
    	@task = Task.new
    end

    def teardown
    	Task.destroy_all
    end
		
		#validations
    test "task must not be empty" do
      assert_not @task.save, 'task should not be saved (valid)'
      assert @task.errors.any?, 'task should create errors'
    end

    test "presence of name" do
      assert @task.invalid?
      assert @task.errors[:name].any?, 'name is not given, error should be thrown'

      assert @task2.valid?
      assert_not @task2.errors[:name].any?, 'name given, should not throw error'
    end

    test "presence of deadline" do
      assert @task.invalid?
      assert @task.errors[:finishing_date].any?, 'deadline is not given, error should be thrown'

      assert @task2.valid?
      assert_not @task2.errors[:finishing_date].any?, 'deadline given, should not throw error'
    end

    # alias attributes
    test "alias attribute for finishing_date" do
      assert_equal @task2.deadline, @task2.finishing_date, 'deadline should be equal finishing_date'
    end

    test "alias attribute for name" do
      assert_equal @task2.title, @task2.name, 'title should be equal name'
    end

  end
end
