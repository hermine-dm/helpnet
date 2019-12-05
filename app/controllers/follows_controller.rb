class FollowsController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@follow=Follow.create(user_id:current_user.id, association_id:params[:association_id])
	end
	def destroy
		@association=Association.find(params[:association_id])
		@follow=@association.follows.find(params[:id])
		@follow.delete
	end
end
