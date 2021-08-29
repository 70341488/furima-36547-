class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_buy, only: [:index, :create]


  def index
    @purchase_residence = PurchaseResidence.new
    unless  current_user.id || @item.user.id || @item.purchase == nil
    redirect_to root_path
  end
  end

  def create
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
    params.require(:purchase_residence).permit(:post_number, :delivery_zone_id, :municipalities, :address, :phone_number, :image, :price, :item_name, :delivery_fee_id, :building_name).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def item_buy
    @item = Item.find(params[:item_id])
  end

end
