class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def create

    @booking = Booking.create(booking_params)

    flash[:notice] = @booking.take_lesson

    redirect_to user_path(@booking.user)
  end

  def index
     if current_user
       @bookings = current_user.bookings
     else
       redirect_to new_user_session_path, notice: 'You are not logged in.'
     end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'The booking was successfully updated.' }
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
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the internet, only allow the whitelist through.
    def booking_params
          params.permit(:user_id, :lesson_id, :full_name, :phone)
    end
end
