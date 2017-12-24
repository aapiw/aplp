class SchedulesController < BaseController
  
  before_action :set_schedule, only: [:update, :index]

  # GET /schedules
  # GET /schedules.json
  def index
    # @schedule = Schedule.last
    @schedule_view = Schedule.last
    @schedule.start_registration = I18n.l(@schedule.start_registration, format: :longtime)
    @schedule.end_registration = I18n.l(@schedule.end_registration, format: :longtime)
    @schedule.start_consulate_selection = I18n.l(@schedule.start_consulate_selection, format: :longtime)
    @schedule.end_consulate_selection = I18n.l(@schedule.end_consulate_selection, format: :longtime)
    @schedule.start_central_selection = I18n.l(@schedule.start_central_selection, format: :longtime)
    @schedule.end_central_selection = I18n.l(@schedule.end_central_selection, format: :longtime)
  end


  # GET /schedules/1
  # GET /schedules/1.json
  # def show
  # end

  # GET /schedules/new
  # def new
  #   # @schedule = Schedule.new
  # end

  # GET /schedules/1/edit
  # def edit
  # end

  # POST /schedules
  # POST /schedules.json
  # def create
  #   @schedule = Schedule.new(schedule_params)

  #   respond_to do |format|
  #     if @schedule.save
  #       format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
  #       format.json { render :show, status: :created, location: @schedule }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @schedule.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    schedule_params_edit = schedule_params
    schedule_params_edit["start_registration"] = localize_month(schedule_params_edit["start_registration"]).to_datetime
    schedule_params_edit["end_registration"] = localize_month(schedule_params_edit["end_registration"]).to_datetime
    schedule_params_edit["start_consulate_selection"] = localize_month(schedule_params_edit["start_consulate_selection"]).to_datetime
    schedule_params_edit["end_consulate_selection"] = localize_month(schedule_params_edit["end_consulate_selection"]).to_datetime
    schedule_params_edit["start_central_selection"] = localize_month(schedule_params_edit["start_central_selection"]).to_datetime
    schedule_params_edit["end_central_selection"] = localize_month(schedule_params_edit["end_central_selection"]).to_datetime
    respond_to do |format|
      if @schedule.update(schedule_params_edit)
        format.html { redirect_to schedules_path, notice: 'Jadwal berhasil diperbaharui.' }
      else
        format.html { render :index }
        flash["alert"] = 'Jadwal gagal diperbaharui.' 
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  # def destroy
  #   @schedule.destroy
  #   respond_to do |format|
  #     format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      # @schedule = Schedule.find(params[:id])
      @schedule = Schedule.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:year, :start_registration, :end_registration, :start_central_selection, :start_consulate_selection, :end_consulate_selection, :end_central_selection)
    end
end
