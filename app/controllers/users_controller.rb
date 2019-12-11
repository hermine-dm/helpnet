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
    if @user.address_id == nil
      address_validation
    else 
      @address=Address.find(@user.address_id)
    end
    if (@user.update(post_params)&&@address.update(address_params))
      flash[:success] = 'Vos informations ont bien été modifiées'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = @user.errors.messages.first
      render :edit
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @address=Address.find(@user.address_id)
      @address.delete
    end
    @user.delete
    flash[:alert] = 'Votre compte a été supprimé'
    if current_user.admin == true
      redirect_back(fallback_location: admin_show_path)
    else 
      redirect_to root_path
    end
  end

  private

  def post_params
      params.require(:user).permit(:name, :first_name, :last_name, :email, :avatar, address_attributes:[:number,:street,:additionnal_information,:zip_code,:city])
  end
  def address_params
      params.require(:address).permit(:number,:street,:additionnal_information,:zip_code,:city)
  end
end
