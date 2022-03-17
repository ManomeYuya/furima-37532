class PurchaseManagementsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :sold_out, only: [:index]
  before_action :user_order, only: [:index]
  
  
  def index
    @purchase_management_address = PurchaseManagementAddress.new
  end

  def create
    @purchase_management_address = PurchaseManagementAddress.new(purchase_management_params)
    if @purchase_management_address.valid?
    pay_item 
    @purchase_management_address.save
    return redirect_to root_path
    else
    render :index
  end
end

  private
  def purchase_management_params
    params.require(:purchase_management_address).permit(:post_code, :delivery_area_id, :municipality, :house_number, :building_name, :telephone_number ).merge(user_id:current_user.id, item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item[:price],
      card: purchase_management_params[:token],
      currency: 'jpy'
    )
  end


  def user_order
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out
    redirect_to root_path if @item.purchase_management.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
