class LogosController < ApplicationController
	def create
	    @association = Association.find(params[:association_id])
	    @association.logo.attach(params[:logo])
	    redirect_back(fallback_location: association_path(@association.id))
  	end
end
