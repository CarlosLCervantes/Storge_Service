class UsersController < ApplicationController
  respond_to :json
  before_filter :setup, except: [:index, :create]
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

  def create
    new_user = User.new(save_params)
    new_user.password_confirmation = new_user.password
    if new_user.save!
      respond_with(new_user)
    else
      respond_with(new_user, status: :error)
    end
  end

  def next_question #gets the next question
    respond_with @user.next_question.to_json(:include => :options)
  end

  private
  def setup
    @user = User.find_by_id(params[:user_id])
  end

  def save_params
    params.require(:user).permit(:first_name, :last_name, :email, 
      :phone, :password)
  end

  def show_params
    [:first_name, :last_name, :email, :phone]
  end
end