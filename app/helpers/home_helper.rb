# frozen_string_literal: true

module HomeHelper
  # Those def are necessary to call the registration form in the Home Page
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
