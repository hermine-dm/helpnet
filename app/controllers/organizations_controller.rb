class OrganizationsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]
  
  def index
  	@organizations = Organization.all
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def new
  end

  def create
    @organization = Organization.new(name: params[:name],description: params[:description], location: params[:location], zip_code: params[:zip_code], website: params[:website], fb_website: params[:fb_website], email: params[:email], num_rna: params[:num_rna]) 
    if @organization.save # essaie de sauvegarder en base
      flash.now[:success] = "Merci l'association a bien été créée" 
      redirect_to organizations_path
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence}"
      puts @organization.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  	@organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    post_params = params.require(:organization).permit(:name, :description, :location, :zip_code, :website, :fb_website, :email, :num_rna, :logo)
    if @organization.update(post_params)
      flash.now[:success] = "Les informations ont bien été prises en compte"
      redirect_to organization_path(@organization.id)
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence}"
      redirect_to organization_path(@organization.id)
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to organizations_path
  end

end
