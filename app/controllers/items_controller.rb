class ItemsController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def new
    @item = Item.new(params[:booking_id])
  end

  def create
    @item = @booking.items.create(item_params)
    redirect_to booking_path(@booking)
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  #   @item = Item.find(params[:id])    
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @item = Item.find(params[:id])
  # 	# @item = Item.find(params[:id])

  # 	if item.update(item_params)
  # 		redirect_to @booking_item
  # 	else
  # 		render :edit, status: :unprocessable_entity
  # 	end
  # end

  def destroy
  	@item = @booking.items.find(params[:id])
  	@item.destroy
  	redirect_to booking_item_path, status: :see_other
  end

	private

  def set_item
    @booking = Booking.find(params[:booking_id])
  end

	def item_params
		params.require(:item).permit(:item_name, :item_weight, :item_size)
	end
end
