class BipaCoursesController < ApplicationController
  before_action :set_bipa_course, only: [:show, :edit, :update, :destroy]

  # GET /bipa_courses
  # GET /bipa_courses.json
  def index
    @bipa_courses = BipaCourse.all
  end

  # GET /bipa_courses/1
  # GET /bipa_courses/1.json
  def show
  end

  # GET /bipa_courses/new
  def new
    @bipa_course = BipaCourse.new
  end

  # GET /bipa_courses/1/edit
  def edit
  end

  # POST /bipa_courses
  # POST /bipa_courses.json
  def create
    @bipa_course = BipaCourse.new(bipa_course_params)

    respond_to do |format|
      if @bipa_course.save
        format.html { redirect_to @bipa_course, notice: 'Bipa course was successfully created.' }
        format.json { render :show, status: :created, location: @bipa_course }
      else
        format.html { render :new }
        format.json { render json: @bipa_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bipa_courses/1
  # PATCH/PUT /bipa_courses/1.json
  def update
    respond_to do |format|
      if @bipa_course.update(bipa_course_params)
        format.html { redirect_to @bipa_course, notice: 'Bipa course was successfully updated.' }
        format.json { render :show, status: :ok, location: @bipa_course }
      else
        format.html { render :edit }
        format.json { render json: @bipa_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bipa_courses/1
  # DELETE /bipa_courses/1.json
  def destroy
    @bipa_course.destroy
    respond_to do |format|
      format.html { redirect_to user_root_path }
      flash[:notice] = 'Kursus Berhasil Dihapus.'
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bipa_course
      @bipa_course = BipaCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bipa_course_params
      params.require(:bipa_course).permit(:location, :long, :unit, :user_id)
    end
end
