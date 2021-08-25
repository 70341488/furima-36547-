class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end

  def update
    
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  
    
      @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :item_condition_id, :delivery_fee_id, :delivery_zone_id,
                                 :category_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

