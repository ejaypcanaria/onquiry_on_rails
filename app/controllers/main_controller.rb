class MainController < ApplicationController
  
  def index
    @question = Question.new
    
    @questions = Question.all.order("questions.created_at DESC")
  end
  
  
  
  def logout
    reset_session
    redirect_to index_path
  end

end