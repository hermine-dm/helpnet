module EventsHelper
	def authenticate_user_event_or_admin #the admin of the organiation or admin
	    @organization = Organization.find(params[:organization_id])
	    unless ((current_user && current_user.organization.nil? == false && current_user.organization.id == @organization.id) || (current_user && current_user.admin == true) )
	    	redirect_to root_path
  		end
  	end
end
