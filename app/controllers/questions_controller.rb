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
  
  def load_more
    @questions = Question.order("questions.created_at DESC").limit(params[:limit]).offset(params[:offset]).to_a
    #@questions = Question.paginate(page: params[:page])
    respond_to do |format|
      format.html { render partial: 'question_feeds', locals: { questions: @questions } }
      format.json { render json: @questions }
    end
  end
  
  def question_param
    params.require(:question).permit(:question, :permalink, :details)
  end

end