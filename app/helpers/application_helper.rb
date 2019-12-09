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
  	
	def bootstrap_class_for_flash(type)
	  case type
	    when 'notice' then "alert-info"
	    when 'success' then "alert-success"
	    when 'error' then "alert-danger"
	    when 'alert' then "alert-warning"
	  end
	end

	def address_validation
		@address=Adress.new(number: params[:number], street:params[:street], additionnal_information:params[:additionnal_information], zip_code:params[:zipcode], city:params[:city])
		if @address.save
			return @address
		else
	      	flash[:error] = "Désolé il y a une erreur :#{@address.errors.full_messages.to_sentence}"
	      	redirect_back(fallback_location: root_path)
		end
	end
end
