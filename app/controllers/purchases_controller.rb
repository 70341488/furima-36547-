class PurchasesController < ApplicationController
  before_action :sold_out_item, only: [:index]


def index
  @item = Item.find(params[:item_id])
  @purchase_residence = PurchaseResidence.new
end

def create
  @item = Item.find(params[:item_id])
  @purchase_residence = PurchaseResidence.new(purchase_params)
  if @purchase_residence.valid?
    pay_item
    @purchase_residence.save
    redirect_to root_path
  else
    render :index
  end
end


private  

def purchase_params
    params.require(:purchase_residence).permit(:post_number, :delivery_zone_id, :municipalities, :address, :phone_number, :image, :price, :item_name, :delivery_fee_id, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
end

def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end

    def sold_out_item
      redirect_to root_path if @item.purchase.present?
     end
     
end
