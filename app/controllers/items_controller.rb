class ItemsController < ApplicationController
  def new
    @item = Item.new(params[:booking_id])
    # @item = Item.new(item_params)

  end

  def create
    @booking = Booking.find(params[:booking_id])
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
    @booking = Booking.find(params[:booking_id])
  	@item = @booking.items.find(params[:id])
  	@item.destroy

  	redirect_to booking_item_path, status: :see_other
  end

	private
		def item_params
			params.require(:item).permit(:item_name, :item_weight, :item_size)
		end
end
