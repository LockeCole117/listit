class ListsController < ApplicationController
  def new
    @list = List.new
    @Title = "New List"
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to list_path(@list), :flash => {:success => "List Created"}
    else
      render 'new'
    end
  end

  def index
    @lists = List.all
    @Title = "Lists"
  end

  def show
    @Title = "List Details"
    begin
      @list = List.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "List not found"}
    end

  end

  def edit
    @Title = "Edit List"
    begin
      @list = List.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "List not found"}
    end
  end

  def update
    begin
      @list = List.find(params[:id])
      if @list.update_attributes(params[:list])
        render 'show'
      else
        render 'edit'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "List not found"}
    end
  end

  def destroy
    begin
      @list = List.find(params[:id])
      @list.destroy
      redirect_to root_path, :flash => {:success => "List Deleted"}
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:error => "List not found"}
    end
  end
end
