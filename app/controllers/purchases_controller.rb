class PurchasesController < ApplicationController


def index
  @item = Item.find(params[:item_id])
  @purchase_residence = PurchaseResidence.new
end

def create
  @item = Item.find(params[:item_id])
  @purchase_residence = PurchaseResidence.new(purchase_params)
  if @purchase_residence.valid?
    @purchase_residence.save
    redirect_to root_path
  else
    render :index
  end
end


private  

def purchase_params
    params.require(:purchase_residence).permit(:post_number, :delivery_zone_id, :municipalities, :address, :phone_number, :image, :price, :item_name, :delivery_fee_id, :building_name).merge(user_id: current_user.id, item_id: @item.id)
end

end
