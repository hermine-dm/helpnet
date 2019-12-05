class AdminController < ApplicationController
	before_action :authenticate_admin

  def show
  	@organizations = Organization.all
  	@users = User.all
  end
end
