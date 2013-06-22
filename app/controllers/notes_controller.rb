class NotesController < ApplicationController
  def new
    @note = Note.new
    @Title = "New Note"
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to note_path(@note), :flash => {:success => "Note Created"}
    else
      render 'new'
    end
  end

  def index
    @notes = Note.all
    @Title = "Notes"
  end

  def show
    @Title = "Note Details"
    begin
      @note = Note.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Note not found"}
    end

  end

  def edit
    @Title = "Edit Note"
    begin
      @note = Note.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Note not found"}
    end
  end

  def update
    begin
      @note = Note.find(params[:id])
      if @note.update_attributes(params[:note])
        render 'show'
      else
        render 'edit'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:notice => "Note not found"}
    end
  end

  def destroy
    begin
      @note = Note.find(params[:id])
      @note.destroy
      redirect_to root_path, :flash => {:success => "Note Deleted"}
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :flash => {:error => "Note not found"}
    end
  end
end
