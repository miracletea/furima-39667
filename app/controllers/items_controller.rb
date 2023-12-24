class ItemsController < ApplicationController
  before_action :move_to_new_user_session, except:[:index, :show, :new]
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

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def move_to_new_user_session
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :shipping_charge_id, :ship_from_to_id, :days_to_ship_date_id, :price).merge(user_id: current_user.id)
  end
end
