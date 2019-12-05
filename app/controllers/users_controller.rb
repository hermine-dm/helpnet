class UsersController < ApplicationController

  before_action :authenticate_user
  before_action :authenticate_current_user, except: [:destroy]
  before_action :authenticate_current_user_or_admin, only: [:destroy]

	def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    post_params = params.require(:user).permit(:name, :first_name, :last_name, :email, :zip_code, :avatar)
    if @user.update(post_params)
      flash[:success] = 'Vos informations ont bien été modifiées'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).delete 
    flash[:alert] = 'Votre compte a été supprimé'
    if current_user.admin == true
      redirect_back(fallback_location: admin_show_path)
    else 
      redirect_to root_path
    end
  end
end
