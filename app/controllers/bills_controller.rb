class BillsController < ApplicationController
		
		around_action :set_bill, only: [:new]

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

	private
	def set_bill
		begin
			puts "========================================I am before filter"
			yield
			puts "===============================================I am after filter"
		end
	end
end