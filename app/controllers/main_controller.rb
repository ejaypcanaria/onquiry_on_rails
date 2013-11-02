class MainController < ApplicationController
  
  def index
    @question = Question.new
    @questions = Question.order("questions.created_at DESC").limit(10).offset(0)
  end
  
  def logout
    reset_session
    redirect_to index_path
  end

end