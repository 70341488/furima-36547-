class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

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

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :item_condition_id, :delivery_fee_id, :delivery_zone_id,
                                 :category_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end
end
