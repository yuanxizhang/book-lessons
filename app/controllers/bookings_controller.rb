class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @current_user.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'The new booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @bookings = booking.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @booking.destroy
     respond_to do |format|
       format.html { redirect_to bookings_url, notice: 'The booking was successfully deleted.' }
       format.json { head :no_content }
     end
  end

  private
    # Use callbacks to share common setup between actions.
    def set_booking
      @booking = booking.find(params[:id])
    end

    # Never trust parameters from the internet, only allow the whitelist through.
    def booking_params
      params.require(:booking).permit(:title, :description, :instructor_id, :instructor_id)
    end
end
