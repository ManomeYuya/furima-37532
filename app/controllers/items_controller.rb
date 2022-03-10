class ItemsController < ApplicationController
  #before_action :set_item, except: [:index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  
  private
  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :image, :category_id, :product_condition_id, :product_condition_id, :burden_of_shipping_charge_id, :delivery_area_id, :days_to_ship_staring_id, :price).merge(user_id: current_user.id)
  end

  #def set_item
   # @items = Item.find(params[:id])
  #end
end
