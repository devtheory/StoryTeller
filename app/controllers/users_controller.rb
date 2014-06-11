class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "Role changed to #{@user.role}"
    else
      flash[:error] = "Something went wrong"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:role)
  end
end