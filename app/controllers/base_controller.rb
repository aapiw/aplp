class BaseController < ApplicationController
  before_action :verify_admin
  
  private

  def verify_admin
  	# debugger
    redirect_to root_url if user
    flash["alert"] = "Kamu tidak mempunyai Otoritas untuk mengakses halaman tersebut" if user
  end

end