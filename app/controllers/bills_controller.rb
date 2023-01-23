class BillsController < ApplicationController
	def index
		@bills = Bill.all
	end

	def show
		@bill = Bill.find(params[:id])
			
	end

	def new
    @booking = Booking.find(params[:booking_id])
    # @booking.items.new
	end

	def create
		@booking = Booking.find(params[:booking_id])
		redirect_to booking_path(@booking)
	end
end