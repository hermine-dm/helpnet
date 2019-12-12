module UsersHelper

	def user_address(user)
		if @user.address_id == nil
        	@address=Address.new
    	else 
        	@address=Address.find(@user.address_id)
    	end
	end

end
