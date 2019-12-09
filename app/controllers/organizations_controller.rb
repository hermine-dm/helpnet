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
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(name: params[:organization][:name],logo: params[:organization][:logo], description: params[:organization][:description], phone: params[:organization][:phone], location: params[:organization][:location], zip_code: params[:organization][:zip_code], website: params[:organization][:website], fb_website: params[:organization][:fb_website], email: params[:organization][:email], num_rna: params[:organization][:num_rna], donate_link: params[:organization][:donate_link], content: params[:organization][:content]) 
    @organization.user_id = current_user.id
    if @organization.save # essaie de sauvegarder en base
      flash[:success] = "Merci l'association est en cours de validation par l'administration" 
      redirect_to organizations_path
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence}"
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
