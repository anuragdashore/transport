class BookingsController < ApplicationController
  
  before_action :set_booking, only: [:show, :change_status, :edit, :destroy]

	def index
		@bookings = current_user.bookings.all.page(params[:page])
    @manager_booking = Booking.all.page(params[:page])
	end

  # Show our bookings
	def show
	end

  def change_status
    if params[:status].present? && Booking::STATUSES.include?(params[:status])
      @booking.update(status: params[:status])
      redirect_to @booking, notice: "Status updated to #{@booking.status}"
    else
      redirect_to @booking, alert: "Stop hacking"
    end
  end

  # Create our new bookings
	def new
  	@booking = current_user.bookings.new(user_id: params[:user_id])
    @booking.items.new
	end

  # Create bookings and save also
  def create
    @booking = current_user.bookings.new(booking_params)

  	if @booking.save
      UserJob.set(wait: 10.second).perform_later(current_user.id)
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edit bookings
  def edit
  end

  # Edit and save bookings
  def update
    @booking = current_user.bookings.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete User
  def destroy
    @booking.destroy

    redirect_to bookings_path, status: :see_other
  end

	private

  def set_booking
    @booking = Booking.find(params[:id])
  end

	def booking_params
		params.require(:booking).permit(:user_id, :pickup_address, :pickup_city, :pickup_state, :pickup_date, :pickup_timing, :deliver_address, :deliver_city, :deliver_state, items_attributes: [:id, :item_name, :item_weight, :item_size, :_destroy])			
	end
end