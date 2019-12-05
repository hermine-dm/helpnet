class AvatarsController < ApplicationController
	def create
	    @user = User.find(params[:user_id])
	    @user.avatar.attach(params[:avatar])
	    redirect_back(fallback_location: user_path(@user.id))
  	end
end
