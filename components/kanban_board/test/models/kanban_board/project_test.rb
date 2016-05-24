require 'test_helper'

module KanbanBoard
  class ProjectTest < ActiveSupport::TestCase

  	def setup
  		@project = Project.new
      @project2 = Project.new(name: "First project", description: "Project for testing", finishing_date: Date.today)
    end

    def teardown
      Project.destroy_all
    end

    #validations
    test "project must not be empty" do
      assert_not @project.save, 'project should not be saved (valid)'
      assert @project.errors.any?, 'project should create errors'
    end

    test "presence of name" do
      assert @project.invalid?
      assert @project.errors[:name].any?, 'name is not given, error should be thrown'

      assert @project2.valid?
      assert_not @project2.errors[:name].any?, 'name given, should not throw error'
    end

    test "presence of deadline" do
      assert @project.invalid?
      assert @project.errors[:finishing_date].any?, 'deadline is not given, error should be thrown'

      assert @project2.valid?
      assert_not @project2.errors[:finishing_date].any?, 'deadline given, should not throw error'
    end

    # alias attributes
    test "alias attribute for finishing_date" do
      assert_equal @project2.deadline, @project2.finishing_date, 'deadline should be equal finishing_date'
    end

    test "alias attribute for name" do
      assert_equal @project2.title, @project2.name, 'title should be equal name'
    end
  end
end
