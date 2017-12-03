class Users::SessionsController < Devise::SessionsController
  include Accessible

  before_action :authenticate_can_sign_in!
  skip_before_action :check_user, only: :destroy
  before_action :set_class

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def set_class
    @body_class = "login-page"
  end

  def authenticate_can_sign_in!
    unless Schedule.can_sign_in?
      redirect_to root_url
      flash["alert"] = "Halaman tidak bisa diakses"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
