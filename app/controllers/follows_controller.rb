class FollowsController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@follow=Follow.create(user_id:current_user.id, organization_id:params[:organization_id])
	end
	def destroy
		@organization=Organization.find(params[:organization_id])
		@follow=@organization.follows.find(params[:id])
		@follow.delete
	end
end
