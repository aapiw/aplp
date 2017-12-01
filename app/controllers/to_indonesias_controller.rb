class ToIndonesiasController < BaseController
  load_and_authorize_resource
  
  before_action :set_to_indonesium, only: [:show, :edit, :update, :destroy]

  # GET /to_indonesia
  # GET /to_indonesia.json
  def index
    @to_indonesia = ToIndonesia.all
  end

  # GET /to_indonesia/1
  # GET /to_indonesia/1.json
  def show
  end

  # GET /to_indonesia/new
  def new
    @to_indonesium = ToIndonesia.new
  end

  # GET /to_indonesia/1/edit
  def edit
  end

  # POST /to_indonesia
  # POST /to_indonesia.json
  def create
    @to_indonesium = ToIndonesia.new(to_indonesium_params)

    respond_to do |format|
      if @to_indonesium.save
        format.html { redirect_to @to_indonesium, notice: 'To indonesium was successfully created.' }
        format.json { render :show, status: :created, location: @to_indonesium }
      else
        format.html { render :new }
        format.json { render json: @to_indonesium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_indonesia/1
  # PATCH/PUT /to_indonesia/1.json
  def update
    respond_to do |format|
      if @to_indonesium.update(to_indonesium_params)
        format.html { redirect_to @to_indonesium, notice: 'To indonesium was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_indonesium }
      else
        format.html { render :edit }
        format.json { render json: @to_indonesium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_indonesia/1
  # DELETE /to_indonesia/1.json
  def destroy
    @to_indonesium.destroy
    respond_to do |format|
      format.html { redirect_to user_root_path }
      flash[:notice] = 'Kunjungan Berhasil Dihapus.'
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_indonesium
      @to_indonesium = ToIndonesia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_indonesium_params
      params.require(:to_indonesium).permit(:destination, :long, :unit, :user_id)
    end
end
