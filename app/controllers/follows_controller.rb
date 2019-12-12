class FollowsController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]

	def create
		@organization = Organization.find(params[:organization_id])
		@follow = Follow.create(user_id:current_user.id, organization_id: @organization.id)
		#flash.now[:success] = "Vous suivez desormais #{@organization.name}"
		respond_to do |format|
        	format.html { redirect_back(fallback_location: organizations_path)}
        	format.js { }
      	end
	end

	def destroy
		@organization = Organization.find(params[:organization_id])
		@follow = @organization.follows.find(params[:id])
		@follow.delete
		#flash.now[:error] = "Vous ne suivez plus #{Organization.find(params[:organization_id]).name}"
		respond_to do |format|
        	format.html { redirect_back(fallback_location: organizations_path)}
        	format.js { }
      	end
	end
end
