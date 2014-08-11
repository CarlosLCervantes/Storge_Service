class UsersController < ApplicationController
  respond_to :json
  before_filter :setup#, except: [:index, :create]

  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by_email(email)
    if user.authenticate(@user)
      respond_with(@user)
    else
      respond_with(@user, status: :error)
    end
  end

  private
  def setup
    @user = User.find_by_id(params[:user_id])
  end
end