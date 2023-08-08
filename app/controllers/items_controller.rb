class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create]


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])

    @item.user == current_user
      @is_seller_item = true
    else
      @is_seller_item = false
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  def require_login
    unless user_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to new_user_session_path
    end
  end
end



