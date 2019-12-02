class UsersController < ApplicationController

	def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:name], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], zip_code: params[:zip_code])
      flash[:success] = 'Vos informations ont bien été modifiées'
      redirect_to @user
    else
      render :edit
    end
  end
end
