require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "A Name should be required" do
  	todo = Todo.new(:name => nil)
  	assert_equal todo.valid?, false
  	assert_not_nil todo.errors[:name]
  end

  test "We can search for all uncompleted todos" do
  	uncompleted_todos = Todo.uncompleted
  	assert_equal uncompleted_todos.include?(todos(:uncompleted)), true
  	assert_equal uncompleted_todos.include?(todos(:completed)), false
  end

  test "We can search for all completed todos" do
  	completed_todos = Todo.completed
  	assert_equal completed_todos.include?(todos(:completed)), true
  	assert_equal completed_todos.include?(todos(:uncompleted)), false
  end
end
