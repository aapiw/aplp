class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  # authorize_resource :class => false

  protect_from_forgery with: :exception

  before_action do
    if current_admin != nil
     authenticate_admin!        
    else
     authenticate_user!
    end
  end

  before_action :set_var
  before_action :configure_permitted_parameters, if: :devise_controller?


  include ApplicationHelper
  
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end
   
  if Rails.env == "production" || Rails.env == "staging"
    rescue_from ActiveRecord::RecordNotFound do |exception|
      Rails.logger.info("=====Error:=======\n\n\n#{exception.backtrace}\n\n\n==================")
      respond_to do |format|
        format.html { render file: "#{Rails.root}/public/404-not-found", layout: false, status: 404 }
      end
    end

    rescue_from ActionController::UnknownFormat do |exception|
      Rails.logger.info("=====Error:=======\n\n\n#{exception.backtrace}\n\n\n==================")
      render file: "#{Rails.root}/public/404-not-found", layout: false, status: 404
    end

    rescue_from ActionView::MissingTemplate, with: :not_found
  end


  def not_found
    # IMPORTANT: If you modify this method, you have to restart the server.
    Rails.logger.info("=====Error:=======\n\n\n no route match \n\n\n==================")
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404-not-found", layout: false, status: 404 }
    end
  end

  def admin
    # debugger
      current_admin
  end

  def user
    # debugger
      current_user
  end

  def set_var
    @admin = current_admin if admin_signed_in?
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :passport, :gender, :country_id, :admin_id, :display_password] )
  end
  
end
