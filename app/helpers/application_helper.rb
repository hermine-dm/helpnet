# frozen_string_literal: true

module ApplicationHelper
  def authenticate_user
    redirect_to new_user_session_path unless current_user
  end

  def authenticate_current_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user && current_user.id == @user.id
  end

  def authenticate_admin
    redirect_to root_path unless current_user && current_user.admin == true
  end

  def authenticate_current_user_or_admin # current_user or admin
    @user = User.find(params[:id])
    unless current_user && (current_user.id == @user.id || current_user.admin == true)
      redirect_to root_path
    end
  end

  def authenticate_user_assoc
    if current_user
      redirect_to root_path if current_user.organization.nil?
    else
      redirect_to root_path
    end
  end

  def is_remote_ip_known(ip)
    users = User.all
    users.each do |user|
      return '8' if ip == user.last_sign_in_ip
    end
  end

  def remote_ip # allow to set a special IP in local
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then 'alert-info'
      when 'success' then 'alert-success'
      when 'error' then 'alert-danger'
      when 'alert' then 'alert-warning'
    end
  end

  def address_validation
    @address = Address.new(number: params[:number], street: params[:street], additionnal_information: params[:additionnal_information], zip_code: params[:zip_code], city: params[:city])
    if @address.save
      return @address
    else
      flash[:error] = "Désolé il y a une erreur :#{@address.errors.full_messages.to_sentence}"
    end
  end
end
