class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :sold_out, only: [:edit]

  def index
    @items = Item.order("created_at DESC")
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
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end

  end

  
  private
  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :image, :category_id, :product_condition_id, :product_condition_id, :burden_of_shipping_charge_id, :delivery_area_id, :days_to_ship_staring_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.purchase_management.present?
  end

end
