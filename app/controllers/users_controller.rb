class UsersController < ApplicationController
  respond_to :json
  before_filter :setup
  def index
    respond_with "Not Found", status: 404
  end

  def show
    if @user
      respond_with @user
    else
      respond_with "Not Found", status: 404
    end
  end

  def question
    #Question.where().take(1).first
    Question.find(:all, 
      :conditions => ['question_id not in (?)', @user.answers.map( &:id )])
  end

  private
  def setup
    @user = User.find_by_id(params[:id])
  end
end