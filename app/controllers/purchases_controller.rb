class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_sold, only: [:index]

  def index
    @item = Item.find(params[:item_id])  # 購入した商品の情報を取得
    @payment_amount = @item.price  # 支払金額を計算（ここでは単純に商品価格としています）
    @purchase_shipping = PurchaseShipping.new
  end


  def create
    @item = Item.find(params[:item_id])
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
    item = Item.find(params[:item_id])
    if item.purchase.present?
      redirect_to root_path, alert: '購入ページにアクセスできません。'
    end
  end

  # トークンを使用して支払い処理を行うメソッド
  def pay_item
    Payjp.api_key = 'sk_test_13e22c33a5421f976a1036ae' # PAY.JPのシークレットキーを設定
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end