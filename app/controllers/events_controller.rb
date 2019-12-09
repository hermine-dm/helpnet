class EventsController < ApplicationController
	before_action :authenticate_user, except: [:show, :index]
	before_action :address_validation, only: [:create]

	def new
		@organization=Organization.find(params[:organization_id])
	end
	def index
		@events=Event.where(organization_id:params[:organization_id])
	end
	def show
		@organization=Organization.find(params[:organization_id])
		@event=Event.find(params[:id])
	end
	def create
		@organization=Organization.find(params[:organization_id])
		@event=Event.new(organization_id:@organization.id,address_id: @address.id, start_date: "#{params[:start_date]} #{params[:start_time]}",end_date: "#{params[:end_date]} #{params[:end_time]}",title: params[:title], description:params[:description], illustration: params[:illustration])
		if @event.save
			flash[:success] = "Evenement créé !" 
      		redirect_to organization_event_path(@organization.id,@event.id)
      	else 
		    flash.now[:error] = "Désolé il y a une erreur :#{@event.errors.full_messages.to_sentence}"
		    @address.destroy
		    render :new
		end
	end
	def edit
		@organization=Organization.find(params[:organization_id])
		@event=Event.find(params[:id])
		@adress=Address.find(@event.address_id)
	end
	def update
		@event = Event.find(params[:id])
		@address = Address.find(@event.address_id)
	    if (@event.update(start_date: "#{params[:start_date]} #{params[:start_time]}",end_date: "#{params[:end_date]} #{params[:end_time]}",title: params[:title], description:params[:description], illustration: params[:illustration]) && @address.update(number: params[:number], street:params[:street], additionnal_information:params[:additionnal_information], zip_code:params[:zip_code], city:params[:city]))
	      flash[:success] = "Les informations ont bien été prises en compte"
	      redirect_to organization_event_path(@organization.id,@event.id)
	    else
	      flash.now[:error] = "Désolé il y a une erreur :#{@event.errors.full_messages.to_sentence} #{@address.errors.full_messages.to_sentence}"
	      render :edit
	    end
	end
	def destroy
		@event=Event.find(params[:id])
		@organization=Organization.find(params[:organization_id])
		@event.destroy
		flash[:success] = "L'évènement a été supprimé"
    	redirect_to organization_path(@organization.id)
	end
end
