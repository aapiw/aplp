class ConfirmationsController < ApplicationController
  before_action :set_var #, only: [:show, :edit, :update, :destroy]

  # GET /confirmations
  # GET /confirmations.json
  def index
    @confirmations = Confirmation.all
  end

  # GET /confirmations/1
  # GET /confirmations/1.json
  def show
  end

  # GET /confirmations/new
  def new
    @confirmation = Confirmation.new
  end

  # GET /confirmations/1/edit
  def edit
  end

  # POST /confirmations
  # POST /confirmations.json
  def create
    
    confirmation_params_edit = confirmation_params
    confirmation_params_edit["flight_arrival_date"] = confirmation_params_edit["flight_arrival_date"].to_date
    confirmation_params_edit["date_of_return_flight"] = confirmation_params_edit["date_of_return_flight"].to_date

    @confirmation = Confirmation.new(confirmation_params_edit)
    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to present_confirmation_index_path }
        flash["notice"] = 'Confirmasi berhasil diperbarui.'
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /confirmations/1
  # PATCH/PUT /confirmations/1.json
  def update
    confirmation_params_edit = confirmation_params
    confirmation_params_edit["flight_arrival_date"] = confirmation_params_edit["flight_arrival_date"].to_date
    confirmation_params_edit["date_of_return_flight"] = confirmation_params_edit["date_of_return_flight"].to_date
    respond_to do |format|
      if @confirmation.update(confirmation_params_edit)
        format.html { redirect_to present_confirmation_index_path, notice: 'Confirmation was successfully updated.' }
        flash["notice"] = 'Confirmasi berhasil diperbarui.'
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /confirmations/1
  # DELETE /confirmations/1.json
  def destroy
    @confirmation.destroy
    respond_to do |format|
      format.html { redirect_to present_confirmation_index_path, notice: 'Confirmation was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_var
      @schedule = Schedule.last
      @user = current_user #User.find(params[:id])
      @confirmation =  @user.confirmation || Confirmation.new
      # @confirmation = Confirmation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmation_params
      params.require(:confirmation).permit(:flight_arrival_number, :flight_arrival_date, :flight_arrival_hours, :flight_return_number, :date_of_return_flight, :return_flight_hours, :hijab, :dress_size, :script, :arrival_ticket, :return_ticket, :user_id)
    end
end
