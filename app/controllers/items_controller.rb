class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_chack, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if 
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_summary, :category_id, :item_status_id, :shipping_charge_id,
                                 :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_signed_chack
    if current_user.id == @item.user_id && @item_order = nil
      redirect_to root_path 
    end
  end
end
