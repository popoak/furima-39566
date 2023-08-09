class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update]

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

    if user_signed_in? && @item.user == current_user
      @is_seller_item = true
    else
      @is_seller_item = false
    end
  end

  def edit
    if user_signed_in? && @item.user == current_user
      @categories = Category.all
      @conditions = Condition.all
      @shipping_fees = ShippingFee.all
      @prefectures = Prefecture.all
      @delivery_times = DeliveryTime.all
    else
      redirect_to root_path, alert: '自分が出品した商品以外は編集できません。'
    end
  end

  def update
    old_price = @item.price

    if params[:item][:image].present?
      @item.image.attach(params[:item][:image])
    end

    if @item.update(item_params)
      new_price = @item.price

      if old_price != new_price
        # 販売手数料の計算ロジックをここに記述します（例として10%の手数料とします）
        sales_fee_percentage = 0.10
        sales_fee = (new_price * sales_fee_percentage).ceil
        @item.update(sales_fee: sales_fee)
      end

      redirect_to item_path(@item), notice: '商品が更新されました。'
    else
      @categories = Category.all
      @conditions = Condition.all
      @shipping_fees = ShippingFee.all
      @prefectures = Prefecture.all
      @delivery_times = DeliveryTime.all
      render :edit
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

  def set_item
    @item = Item.find(params[:id])
  end
end