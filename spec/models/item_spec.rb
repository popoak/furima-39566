require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: user)
  end

# RSpec.describe Item, type: :model do
#   before do
#     # User モデルのインスタンスを作成して item の user 属性に関連付ける
#     user = FactoryBot.create(:user)
#     @item = FactoryBot.build(:item, user: user)
#   end

  describe '出品機能' do
    context '出品機能が保存できる場合' do
      it '全ての項目が存在すれば保存できる' do
        # ここで画像ファイルを添付する
        expect(@item).to be_valid
      end
    end

  context '出品ができない場合' do
    it 'nameが空では登録できない' do
      @item.name = ''  # nameの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("must exist")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''  # descriptionの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが2未満では登録できない' do
      @item.category_id = 1  # categoryが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'conditionが2未満では登録できない' do
      @item.condition_id = 1  # conditionが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'shipping_feeが2未満では登録できない' do
      @item.shipping_fee_id = 1  # shipping_feeが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end    
    it 'delivery_timeが2未満では登録できない' do
      @item.delivery_time_id = 1  # delivery_timeが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end
    it 'priceが空では登録できない' do
      @item.price = nil  # priceの値をnilにする
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角以外では登録できない' do
      @item.price = '１２３'  # priceの値を全角にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は半角数字のみで入力してください")
    end
    it '価格が300円未満では出品できない' do
      @item.price = 299  # priceの値を300円未満にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は¥300〜¥9,999,999の範囲で入力してください")
    end
    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 10_000_000  # priceの値を9,999,999円を超える値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は¥300〜¥9,999,999の範囲で入力してください")
    end
    it 'imageが空では登録できない' do
      @item.image = nil  # 画像の添付を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
end