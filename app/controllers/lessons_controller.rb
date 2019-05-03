class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

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
    if params[:title]
        @lessons = Lesson.where('lower(title) LIKE ?', "%#{params[:title].downcase}%")
    else
        # if no filters are applied, show all Lessons
        @lessons = Lesson.all
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
      params.require(:lesson).permit(:title, :about, :price, :seats, :length, :requirement, :dates, :time, :available, :online, :address, :city, :state, :zipcode,:skill_id, :instructor_id)
  end
end
