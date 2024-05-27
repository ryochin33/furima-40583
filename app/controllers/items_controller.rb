class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_collections, only: [:edit, :update]
  before_action :check_item_owner, only: [:edit, :update]



  def index
    @items = Item.order(created_at: :desc)
  end
  
  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_collections
    @categories = Category.all
    @conditions = Condition.all
    @shipping_burdens = ShippingBurden.all
    @shipping_regions = ShippingRegion.all
    @shipping_times = ShippingTime.all
  end
  
  def item_params
  params.require(:item).permit(
    :name, :description, :category_id, :condition_id, :shipping_burden_id, :shipping_region_id, :shipping_time_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def check_item_owner
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end