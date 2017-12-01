class LandingsController < BaseController
  load_and_authorize_resource
  
  before_action :set_landing, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index, raise: false
  skip_before_action :authenticate_admin!, only: :index, raise: false


  before_action :set_class, only:[:index]

  # GET /landings
  # GET /landings.json
  def index
    @landing = Landing.last
    if @admin
      render "admin_landing"
    end
  end

  # def dashboard_landing
  #   @landing = Landing.last
  # end

  # GET /landings/1
  # GET /landings/1.json
  def show
    @body_class = "bg-four-zero-four"
  end

  # GET /landings/new
  # def new
  #   @landing = Landing.new
  # end

  # GET /landings/1/edit
  def edit
    @admin = current_admin
  end

  # POST /landings
  # POST /landings.json
  # def create
  #   @landing = Landing.new(landing_params)

  #   respond_to do |format|
  #     if @landing.save
  #       format.html { redirect_to @landing, notice: 'Landing was successfully created.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  # PATCH/PUT /landings/1
  # PATCH/PUT /landings/1.json
  def update
    respond_to do |format|
      if @landing.update(landing_params)
        format.html { redirect_to landing_path, notice: 'Halaman Awal berhasil dirubah' }
      else
        format.html { render :index, alert: 'Halaman Awal berhasil dirubah' }
      end
    end
  end

  # DELETE /landings/1
  # DELETE /landings/1.json
  # def destroy
  #   @landing.destroy
  #   respond_to do |format|
  #     format.html { redirect_to landings_url, notice: 'Landing was successfully destroyed.' }
  #   end
  # end

  private
    
    def set_landing
      @landing = Landing.find(params["id"])
    end

    def set_class
      @body_class = "#{@admin ? 'landing' : 'four-zero-four'}"
    end

    def landing_params
      params.require(:landing).permit(:title)
    end

end
