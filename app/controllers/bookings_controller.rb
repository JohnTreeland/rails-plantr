class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_sitter, only: %i[new create]

  def index
     @bookings = Booking.where(user: current_user) # user_id:  current_user.id
  end

  def show; end

  def new
        @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.sitter = @sitter
    if @booking.save
      redirect_to user_booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @booking.update(booking_params)
    # @booking.user = current_user
    # @booking.sitter = @sitter
    if @booking.save
      redirect_to user_booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_sitter
    @sitter = Sitter.find(params[:sitter_id])
  end

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :plants_quantity)
  end
end

end
