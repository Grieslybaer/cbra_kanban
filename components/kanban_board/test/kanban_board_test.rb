require 'test_helper'

class KanbanBoardTest < ActiveSupport::TestCase
  test "engine isolation" do
    assert_kind_of Module, KanbanBoard
  end
end
