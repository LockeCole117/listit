require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "A Name should be required" do
  	list = List.new(:name => nil)
  	assert_equal list.valid?, false
  	assert_not_nil list.errors[:name]
  end

  test "Todos can be added to the List" do
  	list = lists(:one)
  	assert_difference('list.todos.size', +1){
  		list.todos.create(:name => "Stuff to do")
  	}
  end
end
