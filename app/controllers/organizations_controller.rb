class OrganizationsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy, :validate]
  before_action :authenticate_user_assoc_or_admin, only: [:edit, :update]

  def index
  	@organizations = Organization.all.where(validatedbyadmin: true)
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def new
  end

  def create
    @organization = Organization.new(name: params[:name],description: params[:description], location: params[:location], zip_code: params[:zip_code], website: params[:website], fb_website: params[:fb_website], email: params[:email], num_rna: params[:num_rna], donate_link: params[:donate_link], content: params[:content]) 
    if @organization.save # essaie de sauvegarder en base
      flash[:success] = "Merci l'association a bien été créée" 
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

  def validate
    @organization = Organization.find(params[:organization_id])
    if @organization.validatedbyadmin == false then @organization.update(validatedbyadmin: true) else @organization.update(validatedbyadmin: false) end 
    flash[:success] = "Les informations ont bien été prises en compte"
    redirect_back(fallback_location: admin_show_path)
  end

  def update
    @organization = Organization.find(params[:id])
    post_params = params.require(:organization).permit(:name, :description, :location, :zip_code, :website, :fb_website, :email, :num_rna, :logo, :content, :donate_link, :validatedbyadmin)
    if @organization.update(post_params)
      flash[:success] = "Les informations ont bien été prises en compte"
      redirect_to organization_path(@organization.id)
    else
      flash[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence}"
      redirect_to organization_path(@organization.id)
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_back(fallback_location: admin_show_path)
  end

end
