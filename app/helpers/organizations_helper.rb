module OrganizationsHelper
    def authenticate_user_assoc_or_admin #the admin of the organiation or admin
	    @organization = Organization.friendly.find_by_slug(params[:slug])
	    unless ((current_user && current_user.organization.nil? == false && current_user.organization.id == @organization.id) || (current_user && current_user.admin == true) )
	    	redirect_to root_path
  		end
  	end

  	def authenticate_canbeadmin_or_admin #only the admin or a current_user who does not have any other orga
  		unless current_user && (current_user.organization.nil? == true || current_user.admin == true)
	    	redirect_to root_path
  		end
  	end
end
