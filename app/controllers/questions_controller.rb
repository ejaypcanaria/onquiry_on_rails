class QuestionsController < ApplicationController

  def create
    @question = Question.new question_param
    if @question.save
      redirect_to show_question_path(@question)
    end
  end
  
  def show
    @question = Question.find_by_permalink(params[:permalink])
  end
  
  def question_param
    params.require(:question).permit(:question, :permalink, :details)
  end

end