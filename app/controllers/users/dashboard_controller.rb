class Users::DashboardController < ApplicationController
	before_action :set_var #, only: [:show, :edit, :update, :destroy]
	before_action :verify_user

	def index
		# flash.clear
	end
	
	def update
		dashboard_params_edit = dashboard_params
		dashboard_params_edit["dob"] = dashboard_params_edit["dob"].to_date
		dashboard_params_edit["passport_expire"] = dashboard_params_edit["passport_expire"].to_date
		# debugger
	  respond_to do |format|
	    if @user.update(dashboard_params_edit)
	      format.html { redirect_to user_root_path }
	      flash["notice"] = 'Data berhasil diperbarui.'
	    else
	      format.html { render :index }
	      flash["alert"] = @user.errors.full_messages
	      @user.lock = false
	    end
	  end
	end

	def update_password
		respond_to do |format|
		  if @user.update(dashboard_params)
		    format.html { redirect_to user_root_path }
		    flash["notice"] = 'Data berhasil diperbarui.'
		  else
		    format.html { render :index }
		    flash["alert"] = @user.errors.full_messages
		  end
		end
	end

	# def edit
	# end

	private
	
	def set_var
		@schedule = Schedule.last
	  @user = current_user #User.find(params[:id])
	end

	def verify_user
	  redirect_to root_url if admin
	  flash["notice"] = "Silahkan mengakses menu Admin untuk mengelola user" if admin
	end

 	def dashboard_params
    params.require(:user).permit( :name, :country_id, :gender, :passport, :passport_expire, :dob, :admin_id, :skype_id, :password, :password_confirmation,
																	:campus, :majors, :phone, :profession, :lock, :note, :avatar, :passport_image, :complete, :submit_profile,
																	to_indonesias_attributes: [:id, :destination, :long, :unit, :_destroy],
																	bipa_courses_attributes: [:id, :location, :long, :unit, :_destroy] )
  end

end