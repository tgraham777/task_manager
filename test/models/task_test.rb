require_relative '../test_helper'

class TaskTest < Minitest::Test
  # inherit from ModelTest because it is in test_helper and already inherits
  # everything we need from MiniTest
  def test_assigns_attributes_correctly
    task = Task.new({ :title       => "a title",
                      :description => "a description",
                      :id          => 1 })
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end
end
