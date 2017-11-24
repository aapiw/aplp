class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :admin
  before_action :authenticate_admin!, unless: :user
  before_action :set_var
  before_action :configure_permitted_parameters, if: :devise_controller?


  include ApplicationHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def admin
      current_admin
  end

  def user
      current_user
  end

  def set_var
    @admin = current_admin if admin_signed_in?
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :passport, :gender, :country_id, :admin_id] )
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end
  
end
