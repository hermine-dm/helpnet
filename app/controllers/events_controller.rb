class EventsController < ApplicationController
	include EventsHelper
	before_action :authenticate_user, except: [:show, :index]
	before_action :authenticate_user_event_or_admin, only: [:new, :create, :edit, :update]
	before_action :address_validation, only: [:create]

	def new
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
	end
	def index
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@events=Event.where(organization_id:@organization.id).order("created_at desc")
	end
	def show
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@event=Event.friendly.find_by_slug(params[:slug])
		@events=Event.where(organization_id:@organization.id).sample(3)
	end
	def create
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@event=Event.new(organization_id:@organization.id,address_id: @address.id, start_date: params[:start_date],end_date: params[:end_date],title: params[:title], description:params[:description], illustration: params[:illustration])
		if @event.save
			flash[:success] = "Evenement créé !" 
      		redirect_to organization_event_path(@organization.slug,@event.slug)
      	else 
		    flash.now[:error] = "Désolé il y a une erreur :#{@event.errors.full_messages.to_sentence}"
		    @address.destroy
		    render :new
		end
	end
	def edit
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@event=Event.friendly.find_by_slug(params[:slug])
		@address=Address.find(@event.address_id)
	end
	def update
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
		@event = Event.friendly.find_by_slug(params[:slug])
		@address = Address.find(@event.address_id)
	    if (@event.update(post_params)&&@address.update(address_params))
	      flash[:success] = "Les informations ont bien été prises en compte"
	      redirect_to organization_event_path(@organization.slug,@event.slug)
	    else
	      flash.now[:error] = "Désolé il y a une erreur :#{@event.errors.full_messages.to_sentence} #{@address.errors.full_messages.to_sentence}"
	      render :edit
	    end
	end
	def destroy
		@event=Event.friendly.find_by_slug(params[:slug])
		@organization=Organization.friendly.find_by_slug(params[:organization_slug])
	    @address = Adress.find(@event.address_id)
	    @event.partipations.destroy_all
		@event.destroy
		#@address.destroy
		flash[:success] = "L'évènement a été supprimé"
    	redirect_to organization_path(@organization.slug)
	end

	private

	def post_params
	    params.require(:event).permit(:start_date,:end_date,:title,:description,:illustration, address_attributes:[:number,:street,:additionnal_information,:zip_code,:city])
	end
	def address_params
	    params.require(:address).permit(:number,:street,:additionnal_information,:zip_code,:city)
	end
end
