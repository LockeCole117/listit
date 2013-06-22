class TodosController < ApplicationController
  before_filter :get_list

  def new
    @todo = Todo.new
    @Title = "New Todo"
  end

  def create
    @todo = @list.todos.build(params[:todo])
    if @todo.save
      redirect_to list_todo_path(@list, @todo), :flash => {:success => "Todo Created"}
    else
      render 'new'
    end
  end

  def index
    @todos = @list.todos
    @Title = "Todos"
  end

  def show
    @Title = "Todo Details"
    begin
      @todo = Todo.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Todo not found"}
    end

  end

  def edit
    @Title = "Edit Todo"
    begin
      @todo = Todo.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Todo not found"}
    end
  end

  def update
    begin
      @todo = Todo.find(params[:id])
      if @todo.update_attributes(params[:todo])
        render 'show'
      else
        render 'edit'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Todo not found"}
    end
  end

  def toggle_complete
    begin
      @todo = Todo.find(params[:id])
      @todo.completed = !@todo.completed?
      @todo.save
      redirect_to list_path(@list), :flash => {:success => "Todo marked as #{@todo.completed? ? 'Complete' : 'Incomplete'}"}
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Todo not found"}
    end
  end

  def destroy
    begin
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to root_path, :flash => {:success => "Todo Deleted"}
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:error => "Todo not found"}
    end
  end

  protected

  def get_list
    begin
      @list = List.find(params[:list_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path :flash => {:error => "List Not Found"} and return
    end
  end
end
