class AnswersController < ApplicationController
  respond_to :json
  before_filter :setup
  def index
    respond_with @user.answers.to_json(include: :question)
  end

  def show
    @answer = @user.answers.find_by_id(params[:id])
    if @answer
      respond_with @answer
    else
      respond_with "Answer Not Found", status: 404
    end
  end

  def create
    @answer = @user.answers.new(save_params)
    if @answer.save!
      render json: @user.next_question.to_json(:include => :options)
    else
      respond_with "Bad Data", status: :unprocesible_entity
    end
  end

  def update
    @answer = Answer.update(params[:answer])
    if @answer.save
      respond_with @answer
    else
      respond_with "Bad Data", status: :unprocesible_entity
    end
  end

  private
  def setup
    @user = User.find_by_id(params[:user_id])
    respond_with "User Not Found", status: 404 unless @user
  end

  def save_params
    # This says that params[:department] is required, but inside that, only params[:department][:full_name] and 
    # params[:department][:abbreviation] are permitted. Unpermitted params will be stripped out         
    params.require(:answer).permit(:user_id, :question_id, 
      :option_id, :skipped)
  end
end