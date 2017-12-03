class BaseController < ApplicationController
  
  skip_before_action :authenticate_user!
  authorize_resource :class => false

  before_action :verify_admin

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert]  = "Anda tidak mempunyai otoritas untuk mengakses halaman tersebut"
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def verify_admin
    redirect_to root_url if @user
    flash["alert"] = "Kamu tidak mempunyai Otoritas untuk mengakses halaman tersebut" if @user
  end

end