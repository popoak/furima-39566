class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_sold, only: [:index]
  before_action :set_tweet, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @payment_amount = @item.price  # 支払金額を計算（ここでは単純に商品価格としています）
    @purchase_shipping = PurchaseShipping.new
  end


  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path, notice: '購入が完了しました。'
    else
      render :index, status: :unprocessable_entity
    end

    # 購入が完了したら商品のステータスを更新
  # @item.update(status: 'sold')

  # redirect_to @item, notice: '商品が売却済みに更新されました。'
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def redirect_if_sold
    @item = Item.find(params[:item_id])
    if @item.user == current_user ||item.purchase.present?
      redirect_to root_path, alert: '購入ページにアクセスできません。'
    end
  end


  def set_tweet
    @item = Item.find(params[:item_id])
  end

  # トークンを使用して支払い処理を行うメソッド
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end