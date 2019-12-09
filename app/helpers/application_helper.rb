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

  	def authenticate_user_assoc_or_admin
	    @user = current_user
	    @organization = Organization.find(params[:id])
	    unless (@user.organization.id == @organization.id || current_user.admin == true )
	    	redirect_to root_path
  		end
	end

	def is_remote_ip_known(ip)
		users= User.all
		users.each do |user|
			if ip == user.last_sign_in_ip
				return "8"
			end
		end
	end

	def remote_ip #allow to set a special IP in local
		if request.remote_ip == '127.0.0.1'
			# Hard coded remote address
			'123.45.67.89'
		else
			request.remote_ip
		end
	end
  	
	def bootstrap_class_for_flash(type)
	  case type
	    when 'notice' then "alert-info"
	    when 'success' then "alert-success"
	    when 'error' then "alert-danger"
	    when 'alert' then "alert-warning"
	  end
	end
end
