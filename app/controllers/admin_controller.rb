class AdminController < ApplicationController
	before_action :authenticate_admin

  def show
  	@associations = Association.all
  	@users = User.all
  end
end
