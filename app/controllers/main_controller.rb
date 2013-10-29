class MainController < ApplicationController
  
  def index
    @question = Question.new
  end
  

  
  def logout
    reset_session
    redirect_to index_path
  end

end