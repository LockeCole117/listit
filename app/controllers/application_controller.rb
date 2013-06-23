class ApplicationController < ActionController::Base
  protect_from_forgery

  def flash_all
  	flash[:success] = "Some success message"
  	flash[:error] 	= "Some failure message"
  	flash[:notice] 	= "Some notice message"
  end
end
