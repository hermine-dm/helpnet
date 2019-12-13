# frozen_string_literal: true

class OrganizationsController < ApplicationController
  include OrganizationsHelper
  before_action :authenticate_admin, only: %i[destroy validate]
  before_action :authenticate_user_assoc_or_admin, only: %i[edit update]
  before_action :address_validation, only: [:create]
  before_action :authenticate_canbeadmin_or_admin, only: %i[new create]

  def index
    @organizations = Organization.all.where(validatedbyadmin: true).order('created_at desc')
  end

  def show
    @organization = Organization.friendly.find_by_slug(params[:slug])
    @address = Address.find(@organization.address_id)
    @events = @organization.events.sort_by(&:start_date)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(address_id: @address.id, name: params[:organization][:name], logo: params[:organization][:logo], description: params[:organization][:description], phone: params[:organization][:phone], website: params[:organization][:website], fb_website: params[:organization][:fb_website], email: params[:organization][:email], num_rna: params[:organization][:num_rna], donate_link: params[:organization][:donate_link], content: params[:organization][:content])
    @organization.user_id = current_user.id
    if @organization.save # essaie de sauvegarder en base
      flash[:success] = "Merci l'association est en cours de validation par l'administration"
      redirect_to organizations_path
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence}"
      @address.destroy
      render :new
    end
  end

  def edit
    @organization = Organization.friendly.find_by_slug(params[:slug])
    @address = Address.find(@organization.address_id)
  end

  def validate
    @organization = Organization.friendly.find_by_slug(params[:organization_slug])
    @organization.validatedbyadmin == false ? @organization.update(validatedbyadmin: true) : @organization.update(validatedbyadmin: false)
    flash[:success] = 'Les informations ont bien été prises en compte'
    redirect_back(fallback_location: admin_path)
  end

  def update
    @organization = Organization.friendly.find_by_slug(params[:slug])
    @address = Address.find(@organization.address_id)
    if @organization.update(post_params) && @address.update(address_params)
      flash[:success] = 'Les informations ont bien été prises en compte'
      redirect_to organization_path(@organization.slug)
    else
      flash[:error] = "Désolé il y a une erreur :#{@organization.errors.full_messages.to_sentence} #{@address.errors.full_messages.to_sentence}"
      redirect_to organization_path(@organization.slug)
    end
  end

  def destroy
    @organization = Organization.friendly.find_by_slug(params[:slug])
    @address = Address.find(@organization.address_id)
    @organization.user.articles.destroy_all
    @organization.destroy
    flash[:success] = "L'association a été supprimée'"
    redirect_to organizations_path
  end

  private

  def post_params
    params.require(:organization).permit(:name, :description, :website, :fb_website, :email, :num_rna, :logo, :content, :donate_link, :validatedbyadmin, address_attributes: %i[number street additionnal_information zip_code city])
  end

  def address_params
    params.require(:address).permit(:number, :street, :additionnal_information, :zip_code, :city)
  end
end
