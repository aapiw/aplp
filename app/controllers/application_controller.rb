class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_var
  before_action :configure_permitted_parameters, if: :devise_controller?


  include ApplicationHelper
  
   
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

  private

  def set_var
    @admin = current_admin if admin_signed_in?
    @user = current_user if user_signed_in?
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :passport, :gender, :country_id, :admin_id, :display_password] )
  end
  
end
