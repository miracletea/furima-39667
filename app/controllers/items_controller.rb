class ItemsController < ApplicationController
  # before_action :move_to_index, except:[:index, :show]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  private
  # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :shipping_charge_id, :ship_from_to_id, :days_to_ship_date_id, :price).merge(user_id: current_user.id)
  end
end
