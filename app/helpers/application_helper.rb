module ApplicationHelper
	

	def authenticate_user
		unless current_user
	    	redirect_to new_user_session_path
	  	end
	end

	def authenticate_current_user
	    @user = User.find(params[:id])
	    unless (current_user.id == @user.id)
	    	redirect_to root_path
  		end
  	end

	def authenticate_current_user_or_admin
	    @user = User.find(params[:id])
	    unless (current_user.id == @user.id || current_user.admin == true )
	    	redirect_to root_path
  		end
  	end

  	def authenticate_admin
	    @user = current_user
	    unless (@user.admin == true)  
	    	redirect_to root_path
  		end
  	end

end
