class ConfirmationsController < ApplicationController
  
  before_action :verify_user
  before_action :verify_winner
  before_action :set_var #, only: [:show, :edit, :update, :destroy]
  
  # GET /confirmations
  # GET /confirmations.json
  def index
  end

  # GET /confirmations/1
  # GET /confirmations/1.json
  
  # def show
  # end

  # GET /confirmations/new
  # def new
  #   @confirmation = Confirmation.new
  # end

  # GET /confirmations/1/edit
  # def edit
  # end

  # POST /confirmations
  # POST /confirmations.json
  def create
    
    confirmation_params_user = confirmation_params["user"]
    confirmation_params_user["passport_expire"] = localize_month(confirmation_params_user["passport_expire"]).to_date
    
    confirmation_params_edit = confirmation_params
    confirmation_params_edit.delete("user")
    confirmation_params_edit["flight_arrival_date"] = localize_month(confirmation_params_edit["flight_arrival_date"]).to_date
    confirmation_params_edit["date_of_return_flight"] = localize_month(confirmation_params_edit["date_of_return_flight"]).to_date

    @confirmation = Confirmation.new(confirmation_params_edit)
    if @user.update_attributes(confirmation_params_user)
      respond_to do |format|
        if @confirmation.save
          format.html { redirect_to present_confirmation_index_path }
          flash["notice"] = 'Konfirmasi berhasil diperbarui.'
        else
          format.html { render :index }
          flash["alert"] = @confirmation.errors.full_messages
        end
      end
      
      else
        render :index
        flash["alert"] = @user.errors.full_messages
      end
  end

  # PATCH/PUT /confirmations/1
  # PATCH/PUT /confirmations/1.json
  def update
    confirmation_params_user = confirmation_params["user"]
    confirmation_params_user["passport_expire"] = localize_month(confirmation_params_user["passport_expire"]).to_date
    
    confirmation_params_edit = confirmation_params
    confirmation_params_edit.delete("user")
    confirmation_params_edit["flight_arrival_date"] = localize_month(confirmation_params_edit["flight_arrival_date"]).to_date
    confirmation_params_edit["date_of_return_flight"] = localize_month(confirmation_params_edit["date_of_return_flight"]).to_date
    
    if @user.update_attributes(confirmation_params_user)
        respond_to do |format|
          if @confirmation.update(confirmation_params_edit)
            format.html { redirect_to present_confirmation_index_path }
            flash["notice"] = 'Konfirmasi berhasil diperbarui.'
          else
            format.html { render :index }
            flash["alert"] = @confirmation.errors.full_messages
          end
        end
      else
        render :index
        flash["alert"] = @user.errors.full_messages
    end

    

  end

  # DELETE /confirmations/1
  # DELETE /confirmations/1.json
  # def destroy
  #   @confirmation.destroy
  #   respond_to do |format|
  #     format.html { redirect_to present_confirmation_index_path, notice: 'Confirmation was successfully destroyed.' }
  #   end
  # end

  private
    def verify_winner
      redirect_to root_url unless current_user.win
      flash["alert"] = "Kamu tidak mempunyai Otoritas untuk mengakses halaman tersebut" unless current_user.win
    end

    def verify_user
      redirect_to root_url unless current_user
      flash["alert"] = "Kamu tidak mempunyai Otoritas untuk mengakses halaman tersebut" unless current_user
    end

    def set_var

      @schedule = Schedule.last
      @user = current_user #User.find(params[:id])
      # if @user
      @confirmation =  @user.confirmation || Confirmation.new
      # end
      # @confirmation = Confirmation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmation_params
      params.require(:confirmation).permit(:flight_arrival_number, :flight_arrival_date, :flight_arrival_hours, :flight_return_number, :date_of_return_flight, :return_flight_hours, :hijab, :dress_size, :script, :arrival_ticket, :return_ticket, :user_id, 
        user: [:passport, :passport_expire, :save_confirmation] )
        # ,user_attributes: [:passport, :passport_expire, :save_confirmation])
    end
end
