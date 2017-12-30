class ScoresController < BaseController
  
  before_action :set_score, only: [:edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  # def index
  #   @scores = Score.all
  # end

  # GET /scores/1
  # GET /scores/1.json
  # def show
  # end

  # GET /scores/new
  # def new
  #   @score = Score.new
  # end

  # GET /scores/1/edit
  def edit
   
  end

  # POST /scores
  # POST /scores.json
  # def create
  #   @score = Score.new(score_params)

  #   respond_to do |format|
  #     if @score.save
  #       format.html { redirect_to @score, notice: 'Score was successfully created.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      debugger
      if @score.update(score_params)
        format.html { redirect_to admins_dashboard_path(@score.user), notice: "Lomba berhasil dirubah" }
      else
        format.html { render :edit }
        flash[:alert] =  @user.errors.full_messages
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  # def destroy
  #   @score.destroy
  #   respond_to do |format|
  #     format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
      @user = @score.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:plot, :content, :bahasa, :fluency, :interlude, :gesture, :sound, :media, :duration, :showing, :user_id, :note, :kind, :scoring, :scoring_pidato, :scoring_bercerita, :giver)
    end
end
