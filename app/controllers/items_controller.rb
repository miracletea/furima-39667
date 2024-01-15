class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_page, except:[:index, :show, :new, :create]
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
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy      
      redirect_to items_path
    end
  end

  private
  def move_to_page
    # サインインかつ商品が購入されてないとき
    if user_signed_in? && @item.order.present? == false
        if current_user.id == @item.user_id 
        else
          redirect_to items_path
        end
    else
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :shipping_charge_id, :ship_from_to_id, :days_to_ship_date_id, :price).merge(user_id: current_user.id)
  end
end
