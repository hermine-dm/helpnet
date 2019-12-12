class FollowsController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@follow=Follow.create(user_id:current_user.id, organization_id:@organization.id)
		flash[:success] = "Vous suivez desormais #{@organization.name}"
		redirect_back(fallback_location: organizations_path)
	end
	def destroy
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@follow=@organization.follows.find(params[:id])
		@follow.delete
		flash[:error] = "Vous ne suivez plus #{@organization.name}"
		redirect_back(fallback_location: organizations_path)
	end
end
