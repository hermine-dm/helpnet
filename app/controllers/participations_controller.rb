class ParticipationsController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@organization=Organization.find(params[:organization_id])
		@event=Event.find(params[:event_id])
		@participation=Participation.create(user_id:current_user.id, event_id:@event.id)
		flash[:success] = "Vous êtes inscrit à cet évènement" 
		redirect_back(fallback_location: organization_event_path(@event.id,@organization.id))
	end
	def destroy
		@organization=Organization.find(params[:organization_id])
		@event=Event.find(params[:event_id])
		@participation=@event.participations.find(params[:id])
		@participation.delete
		flash[:success] = "Vous êtes désinscrit de cet évènement" 
		redirect_back(fallback_location: organization_event_path(@event.id,@organization.id))
	end
end
