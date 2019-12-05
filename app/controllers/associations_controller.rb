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
    @association = Association.new(name: params[:name],description: params[:description], location: params[:location], zip_code: params[:zip_code], website: params[:website], fb_website: params[:fb_website], email: params[:email], num_rna: params[:num_rna]) 
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
    post_params = params.require(:association).permit(:name, :description, :location, :zip_code, :website, :fb_website, :email, :num_rna, :logo)
    if @association.update(post_params)
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
