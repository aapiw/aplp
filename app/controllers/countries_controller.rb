class CountriesController < BaseController
  
  before_action :set_country, only: [:edit, :show, :update, :destroy]
  skip_authorize_resource only: :consulate_lists
  skip_before_action :verify_admin, only: [:consulate_lists]
  
  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
    @country = Country.new
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to countries_path, notice: "Negara #{@country.name} berhasil di tambahkan" }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to countries_path, notice: "Negara berhasil di rubah." }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: "Negara #{@country.name} berhasil dihapus" }
      format.json { head :no_content }
    end
  end

  def consulate_lists
    @consulates = Country.find(params["id"]).admins.where(role:"consulate")
    @consulates = @consulates.collect {|c| [ c.name, c.id ] } if @consulates
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :country_code, :iso_code)
    end
end
