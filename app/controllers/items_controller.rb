class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


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
    if  @item.user == current_user
      @is_seller_item = true
    else
      @is_seller_item = false
    end
  end

  def edit
    if @item.user != current_user || @item.purchase.present?
      redirect_to root_path, alert: '自分が出品した商品以外は編集できません。'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品が更新されました。'
     else
      render :edit
    end
  end
  
  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path, notice: '商品が削除されました。'
    else
      redirect_to root_path, alert: '自分が出品した商品以外は削除できません。'
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

  def purchase
    @item = Item.find(params[:id])
  
    if @item.user != current_user && @item.available_for_purchase?
      # 購入処理を実行（在庫の減少、購入履歴の追加など）
      @item.purchase_by(current_user)
      redirect_to root_path, notice: '商品を購入しました。'
    else
      redirect_to item_path(@item), alert: '購入できませんでした。'
    end
  end


end