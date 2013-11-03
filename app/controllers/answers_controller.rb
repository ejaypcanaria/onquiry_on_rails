class AnswersController < ApplicationController

  def create
    @answer = Answer.new to_param
    
    respond_to do |format|
      if @answer.save
        format.html { render partial: 'answer_in_question', locals: { answer: @answer } }
        format.json { render json: @answer }
      else
        format.json { render json: @answer.error }
      end
      
    end
  end

  def to_param
    params.required(:answer).permit(:answer, :question_id, :user_id)
  end

end