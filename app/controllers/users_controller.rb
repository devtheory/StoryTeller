class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @collaborators = User.where("role = ? OR role = ?", "writer", "collaborator")
    @stories = current_user.stories.all
  end

  def update

    collaborator = User.find(params[:id])
 
    unless params.has_key?(:user)
      params['user'] = { collaborating_on: "none"}
    end

    collaborator.update_attributes(collaborating_on: params[:collaborating_on])
    
    if collaborator.update_attributes(user_params)
      redirect_to users_path, notice: "Collaborators updated"
    else
      flash[:error] = "Something went wrong"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:role, :collaborating_on)
  end
end