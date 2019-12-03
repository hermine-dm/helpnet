class AssociationsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]
  
  def index
  	@associations = Association.all
  end

  def show
  	@association = Association.find(params[:id])
  end

  def new
  end

  def create
    @association = Association.new(name: params[:name],description: params[:description], location: params[:location], zip_code: params[:zip_code], website: params[:website], fb_website: params[:fb_website], email: params[:email], num_rna: params[:num_rna], logo_url: params[:logo_url]) 
    if @association.save # essaie de sauvegarder en base
      flash.now[:success] = "Merci l'association a bien été créée" 
      redirect_to associations_path
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@association.errors.full_messages.to_sentence}"
      puts @association.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  	@association = Association.find(params[:id])
  end

  def update
    @association = Association.find(params[:id])
    post_params = params.require(:association).permit(:name, :description, :location, :zip_code, :website, :fb_website, :email, :num_rna, :logo_url)  
    if @association.update(name: post_params[:name], description: post_params[:description], location: post_params[:location], zip_code: post_params[:zip_code], website: post_params[:website], fb_website: post_params[:fb_website], email: post_params[:email], num_rna: post_params[:num_rna], logo_url: post_params[:logo_url])
      flash.now[:success] = "Les informations ont bien été prises en compte"
      redirect_to association_path(@association.id)
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@association.errors.full_messages.to_sentence}"
      redirect_to association_path(@association.id)
    end
  end

  def destroy
    @association = Association.find(params[:id])
    @association.destroy
    redirect_to associations_path
  end
end
