class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @instructor.lessons.build(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @instructors = Instructor.all

		if params[:instructor_id]
      @lessons = Instructor.find(params[:instructor_id]).Lessons
    else
      if params[:search]
        @lessons = Lesson.search(params[:search])
      elsif !params[:instructor].blank?
        @lessons = Lesson.where(instructor: params[:instructor])
      elsif !params[:date].blank?
        if params[:date] == "Today"
          @lessons = Lesson.where("created_at >=?", Time.zone.today.beginning_of_day)
        else
          @lessons = Lesson.where("created_at <?", Time.zone.today.beginning_of_day)
        end
      else
        # if no filters are applied, show all Lessons
        @lessons = Lesson.all
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @lesson.destroy
     respond_to do |format|
       format.html { redirect_to lessons_url, notice: 'Lesson was successfully deleted.' }
       format.json { head :no_content }
     end
  end

  private
  # Use callbacks to share common setup between actions.
  def set_lesson
      @lesson = Lesson.find(params[:id])
  end

  # Never trust parameters from the internet, only allow the whitelist through.
  def lesson_params
      params.require(:lesson).permit(:title, :description, :instructor_id, :instructor_id)
  end
end
