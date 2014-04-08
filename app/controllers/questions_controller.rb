class QuestionsController < ApplicationController
  respond_to :json
  def index
    @questions = Question.all
    respond_with @questions.to_json(:include => :options)
  end

  def show
    @question = Question.find_by_id(params[:id])
    if @question
      respond_with @question.to_json(:include => :options)
    else
      respond_with "Not Found", status: 404
    end
  end
end