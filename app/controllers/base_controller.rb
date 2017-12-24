class BaseController < ApplicationController
  
  skip_before_action :authenticate_user!
  authorize_resource :class => false

  before_action :verify_admin

  def current_ability
    user_id = params[:id] if admin_actions
    @current_ability ||= AdminAbility.new(admin: current_admin, user: user_id)
  end
  
  def admin_actions
    (controller_name == "dashboard") and (action_name == "show" or action_name == "update_user" or action_name == "index" or action_name == "destroy")
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert]  = "Anda tidak mempunyai otoritas untuk mengakses halaman tersebut."
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def verify_admin
    redirect_to root_url if @user
    flash["alert"] = "Anda tidak mempunyai Otoritas untuk mengakses halaman tersebut." if @user
  end

end