class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'The instructor was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @instructors = Instructor.all.order( 'name ASC' )
  end

  def show
    @reviews = @instructor.reviews.all.order( 'created_at DESC')
  end

  def edit
  end

  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'The instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @instructor.destroy
     respond_to do |format|
       format.html { redirect_to instructors_url, notice: 'instructor was successfully deleted.' }
       format.json { head :no_content }
     end
  end

  private
    # Use callbacks to share common setup between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the internet, only allow the whitelist through.
    def instructor_params
      params.require(:instructor).permit(:name, :bio, :class_time)
    end
end
