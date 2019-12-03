class AssociationsController < ApplicationController
  def index
  	@associations = Association.all
  end

  def show
  	@association = Association.find(params[:id])
  end

  def new
  end
  
  def create
  end

  def edit
  	association = Association.find(params[:id])
  end
end
