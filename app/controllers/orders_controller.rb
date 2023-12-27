class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_page, only:[:index]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

private

  def order_params
    params.require(:order_form).permit(:postal_code, :ship_from_to_id, :city_town_village, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_page
    if user_signed_in?
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

end
