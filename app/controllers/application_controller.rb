class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # load_and_authorize_resource

  include ApplicationHelper
  
  # Catch all CanCan errors and alert the user of the exception
  # rescue_from CanCan::AccessDenied do | exception |
  #   redirect_to root_url, allocation_generation: exception.message
  # end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :passport, :gender, :country_id, :admin_id] )
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end
  
end
