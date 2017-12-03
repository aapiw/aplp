class ToIndonesiasController < BaseController
  
  before_action :set_to_indonesia, only: [:destroy]

  # GET /to_indonesia
  # GET /to_indonesia.json
  # def index
  #   @to_indonesia = ToIndonesia.all
  # end

  # # GET /to_indonesia/1
  # # GET /to_indonesia/1.json
  # def show
  # end

  # # GET /to_indonesia/new
  # def new
  #   @to_indonesia = ToIndonesia.new
  # end

  # # GET /to_indonesia/1/edit
  # def edit
  # end

  # # POST /to_indonesia
  # # POST /to_indonesia.json
  # def create
  #   @to_indonesia = ToIndonesia.new(to_indonesia_params)

  #   respond_to do |format|
  #     if @to_indonesia.save
  #       format.html { redirect_to @to_indonesia, notice: 'To indonesium was successfully created.' }
  #       format.json { render :show, status: :created, location: @to_indonesia }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @to_indonesia.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /to_indonesia/1
  # # PATCH/PUT /to_indonesia/1.json
  # def update
  #   respond_to do |format|
  #     if @to_indonesia.update(to_indonesia_params)
  #       format.html { redirect_to @to_indonesia, notice: 'To indonesium was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @to_indonesia }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @to_indonesia.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /to_indonesia/1
  # DELETE /to_indonesia/1.json
  def destroy
    @to_indonesia.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      flash[:notice] = 'Kunjungan Berhasil Dihapus.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_indonesia
      @to_indonesia = ToIndonesia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list througha    
    def to_indonesia_params
      params.require(:to_indonesia).permit(:destination, :long, :unit, :user_id)
    end
end
