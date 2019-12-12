class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user
  before_action :authenticate_current_user, except: [:destroy]
  before_action :authenticate_current_user_or_admin, only: [:destroy]

	def show
    @user = User.find(params[:id])
    user_address(@user)
    @events = current_user.events.limit(3)
    user_liked_articles(current_user)
  end

  def edit
    @user = User.find(params[:id])
    user_address(@user)
  end

  def update
    @user = User.find(params[:id])
    user_address(@user)
    if (@user.update(post_params)&&@address.update(address_params))
      @user.update(address_id:@address.id)
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
      redirect_back(fallback_location: admin_path)
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
