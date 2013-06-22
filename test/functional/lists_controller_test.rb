require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:list).new_record?
  end

  test "should create a new list" do
    assert_difference('List.count', +1){
      post :create, :list => {:name => "new list"}
    }
    assert_response :success
    assert_equal assigns(:list).new_record?, false
  end

  test "should not create an invalid list" do
    post :create, :list => {:name => nil}
    assert_response :bad
  end

  test "should allow a list to be edited" do
    get :edit, :id => lists(:one)
    assert_response :success
    assert_equal assigns(:list), lists(:one)
  end

  test "should redirect to index if the list does not exit" do
    get :edit, :id => List.count + 1
    assert_redirected_to :index
  end

  test "should update an existing list" do
    list = List.create(:name => "old_name")
    post :update, :list => {:id => list.id, :name => "new_name"}
    assert_response :success
    assert_equal assigns(:list), list
    list.reload
    assert_equal list.name, "new_name"
  end

  test "should show an existing list" do
    get :show, :id => lists(:one)
    assert_response :success
    assert_equal assigns(:list), lists(:one)
  end

  test "should redirect to index if the list does not exist" do
    get :show, :id => List.count + 1
    assert_redirected_to :index
  end

  test "should get all the lists" do
    get :index
    assert_response :success
    assert_equal assigns(:lists), List.all
  end

  test "should destroy an existing list" do
    list = List.create(:name =>"to_delete")
    assert_difference('List.count', -1){
      delete :destroy, :id => list.id
    }
    assert_response :success
  end

  test "should redirect to index if the list is not found" do
    delete :destroy, :id => List.count + 1
    assert_redirected_to :index
  end

end
