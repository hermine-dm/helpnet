class EventsController < ApplicationController
	include EventsHelper
	before_action :authenticate_user, except: [:show, :index]
	before_action :authenticate_user_event_or_admin, only: [:new, :create, :edit, :update]
	before_action :address_validation, only: [:create]

	def new
		@organization=Organization.find(params[:organization_id])
	end
	def index
		@events=Event.where(organization_id:params[:organization_id])
		@organization=Organization.find(params[:organization_id])
	end
	def show
		@organization=Organization.find(params[:organization_id])
		@event=Event.find(params[:id])
		@events=Event.where(organization_id:params[:organization_id]).sample(3)
	end
	def create
		@organization=Organization.find(params[:organization_id])
		@event=Event.new(organization_id:@organization.id,address_id: @address.id, start_date: params[:start_date],end_date: params[:end_date],title: params[:title], description:params[:description], illustration: params[:illustration])
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
		@address=Address.find(@event.address_id)
	end
	def update
		@organization=Organization.find(params[:organization_id])
		@event = Event.find(params[:id])
		@address = Address.find(@event.address_id)
	    if (@event.update(post_params)&&@address.update(address_params))
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
	    @address = Adress.find(@event.address_id)
		@event.destroy
		@address.destroy
		flash[:success] = "L'évènement a été supprimé"
    	redirect_to organization_path(@organization.id)
	end

	private

	def post_params
	    params.require(:event).permit(:start_date,:end_date,:title,:description,:illustration, address_attributes:[:number,:street,:additionnal_information,:zip_code,:city])
	end
	def address_params
	    params.require(:address).permit(:number,:street,:additionnal_information,:zip_code,:city)
	end
end
