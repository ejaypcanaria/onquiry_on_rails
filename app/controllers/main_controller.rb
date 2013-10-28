class MainController < ApplicationController
  
  def index
  end
  
  def logout
    reset_session
    redirect_to index_path
  end

end