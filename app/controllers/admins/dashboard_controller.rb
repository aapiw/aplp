class Admins::DashboardController < BaseController
	# load_and_authorize_resource :class => "Admins::DashboardController" #, find_by: :find_by_id
	# load_and_authorize_resource
	# authorize_resource :class => false
	

	before_action :set_var, only: [:show, :edit, :update, :index]
	before_action :set_var_consulate, only: [:edit_consulate, :update_consulate, :destroy_consulate ]
	before_action :set_user, only: [:update_user, :confirm, :destroy]#:destroy, :contest, :lock, :activate]
	skip_authorize_resource :only => :filters

	def index
		# flash.clear
		@users = User.all
		@user_count = User.count
		@user_complite_count = User.completes.count
		@country_count = Country.count
		@consulate_count = Admin.consulates.count
		@consulates =  Admin.where(role:"consulate")
		@consulates = @consulates.collect {|c| [ c.name, c.id ] }
	end
	
	def update
	end

	def show
		
	end

	# def edit
	# end

	def consulates
		@consulates = Admin.consulates
		@consulate = Admin.new
		@admin = current_admin
	end

	def edit_consulate
		# @consulate = User.find(params[:id]) if params[:consulate_id]
	end

	def destroy_consulate
	  @consulate.destroy
	  respond_to do |format|
	    format.html { redirect_to consulates_path }
	     flash["notice"] = "KBRI/KJRI dengan id nama #{@consulate.name} berhasil dihapus"
	  end
	end

	def new_consulate
		@consulate = Admin.new
	end

	def create_consulate
		admin_params2 = admin_params
		admin_params2["country_ids"] = admin_params2["country_ids"].reject(&:empty?)
		@consulate = Admin.new(admin_params2)
	  
	  respond_to do |format|
	  	if @consulate.save
		    format.html { redirect_to consulates_path }
		    flash["notice"] = "KBRI/KJRI dengan nama #{@consulate.name} berhasil ditambahkan"
		  else
		  	format.html { render :edit_consulate }
		  	flash["alert"] = @consulate.errors.full_messages
	  	end
		end
	end
	
	def update_consulate
		admin_params2 = admin_params
		admin_params2["country_ids"] = admin_params2["country_ids"].reject(&:empty?)
	  respond_to do |format|
	  	if @consulate.update(admin_params2)
		    format.html { redirect_to consulates_path }
		    flash["notice"] = "KBRI/KJRI berhasil dirubah"
		  else
		  	format.html { render :edit_consulate }
		  	flash["alert"] = @consulate.errors.full_messages
	  	end
		end
	end

	def destroy
	  @user.destroy
	  respond_to do |format|
	    format.html { redirect_to admin_root_path }
	     flash["notice"] = "User dengan id #{@user.id_reg} berhasil dihapus"
	  end
	end

	def confirm
		if @user.confirm
			redirect_to admins_dashboard_path(@user)
		  flash["notice"] = "User berhasil dirubah"
		else
			redirect_to admins_dashboard_path(@user)
		  flash["alert"] = "User gagal dirubah"
		end
	end

	def update_user
		if @user.update(dashboard_params)
			redirect_to admins_dashboard_path(@user)
		  flash["notice"] = "User berhasil dirubah"
		else
			redirect_to admins_dashboard_path(@user)
		  flash["alert"] = "User gagal dirubah"
		end
	end

	def filters
		@users = User.where(nil)
		params["filters"].each do |key, value|
			
			if ["true","false","nil"].include? value
				value_edit = eval(value)
				else
				value_edit = value
			end
			# debugger
	    @users = @users.public_send("search_#{key}", value_edit ) if value.present?
	  end

		# @users = User.filters(params["filters"])
		# public_send
		# params.slice(:year, :kind, :country, :consulate, :complete, :win)
	end
	
	# def filtering_params(params)
	#   params.slice(:year, :kind, :country, :consulate, :complete, :win)
	# end


	# def contest
	# 	if @user.update(dashboard_params)
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["notice"] = "User berhasil dirubah"
	# 	else
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["alert"] = "User berhasil dirubah"
	# 	end
	# end

	# def lock
	# 	if @user.update(dashboard_params)
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["notice"] = "User berhasil dirubah"
	# 	else
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["alert"] = "User gagal dirubah"
	# 	end
	# end

	# def activate
	# 	if @user.update(dashboard_params)
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["notice"] = "User berhasil dirubah"
	# 	else
	# 		redirect_to admins_dashboard_path(@user)
	# 	  flash["alert"] = "User gagal dirubah"
	# 	end
	# end

	private
	
	def set_user
		@user = User.find(params[:id])
	end

	def set_var
		@schedule = Schedule.last
		@admin = current_admin
	  @user = User.find(params[:id]) if params[:id] #and params[:id].to_i > 0
	  @countries = Country.all
	  @score = @user.score if @user
	end
	
	def set_var_consulate
		@admin = current_admin
		@consulate = Admin.find(params[:id])
	end

	def dashboard_params
	  params.require(:user).permit( :name, :country_id, :gender, :passport, :passport_expire, :dob, :admin_id, :skype_id, :contest, :win, :display_password,
																	:campus, :majors, :phone, :profession, :lock, :note, :avatar, :passport_image, :complete, :submit_profile,
																	to_indonesias_attributes: [:id, :destination, :long, :unit, :_destroy],
																	bipa_courses_attributes: [:id, :location, :long, :unit, :_destroy] )
	end

  def admin_params
     params.require(:admin).permit( :name, :email, :contact, :role, :username, :password, :password_confirmation, country_ids:[])
  end

end