class QuestionsController < ApplicationController

  def create
    @question = Question.new question_param
    @question.user_id = session[:id]
    if @question.save
      redirect_to show_question_path(@question)
    elsif @question.already_exist?
        redirect_to show_question_path(@question)
    else
      @questions = Question.order("questions.created_at DESC").limit(10).offset(0)
      render template: 'main/index'
    end
  end

  def update
    @question = Question.find_by_id(params[:question][:id])
    @question.details = params[:question][:details]
    
    respond_to do |format|
      
      if @question.save
        format.json { render json: @question }
      else
        format.json { render json: @question.errors }
      end
      
      format.html { render action: :show }
    end
    
  end
  
  def show
    @question = Question.find_by_permalink(params[:permalink])
  end
  
  def load_more
    @questions = Question.order("questions.created_at DESC").limit(params[:limit]).offset(params[:offset]).to_a
    respond_to do |format|
      format.html { render partial: 'question_feeds', locals: { questions: @questions } }
      format.json { render json: @questions }
    end
  end
  
  def question_param
    params.require(:question).permit(:question, :permalink, :details)
  end  

end