class EventsController < ApplicationController
	before_action :authenticate_user
	before_action :address_validation, only: [:create,:edit]

	def new
		@organization=Organization.find(params[:organization_id])
	end
	def create
		@organization=Organization.find(params[:organization_id])
		@event=Event.new(organization_id:@organization.id,address_id: @address.id, start_date: "#{params[:start_date]} #{params[:start_time]}",end_date: "#{params[:end_date]} #{params[:end_time]}",title: params[:title], description:params[:description])
		if @event.save
			flash[:success] = "Evenement créé !" 
      		redirect_to organization_event_path(@organization.id,@event.id)
      	else 
		    flash.now[:error] = "Désolé il y a une erreur :#{@event.errors.full_messages.to_sentence}"
		    @address.destroy
		    render :new
		end
	end
end
