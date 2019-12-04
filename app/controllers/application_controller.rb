class ApplicationController < ActionController::Base
	include ApplicationHelper
	before_action :configure_devise_parameters, if: :devise_controller?
	before_action :update_last_sign_in_at
	
	def configure_devise_parameters
	  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation)}
	  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :first_name, :last_name, :description, :email, :zip_code, :password, :password_confirmation, :current_password)}
	end

	def update_last_sign_in_at #permet de mettre a jour toutes les atributs liés à devise trackable
	 if user_signed_in? && !session[:logged_signin]
	    sign_in(current_user, :force => true)
	    session[:logged_signin] = true
	  end
	end

	
end
