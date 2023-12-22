class ItemsController < ApplicationController
  # before_action :move_to_index, except:[:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :shipping_charge_id, :ship_form_to_id, :days_to_ship_date_id, :price)
  end
end
