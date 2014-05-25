class InvitesController < ApplicationController
  respond_to :json
  before_filter :setup, except: [:show]
  def index
    @user.invites
  end

  def show
    invite = Invite.find_by_id(params[:id])
    if invite
      respond_with invite
    else
      respond_with(nil, status: :not_found)
    end
  end

  def create
    new_invite = @user.invites.new(save_params)
    if new_invite.save!
      render :json => new_invite
      #respond_with new_invite
    else
      respond_with(new_invite, status: :error)
    end
  end

  private
  def setup
    @user = User.find_by_id(params[:user_id])
    raise ActionController::RoutingError.new('Not Found') unless @user
  end

  def save_params
    params.require(:invite).permit(:user_id, :phone, :first_name)
  end

  def show_params
    [:user_id, :phone, :first_name]
  end
end