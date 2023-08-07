require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)  # itemのインスタンス生成
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
        expect(@item).to be_valid
      end
    end

  context '出品ができない場合' do
    it 'nameが空では登録できない' do
      @item.name = ''  # nameの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''  # descriptionの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが2未満では登録できない' do
      @item.category_id = 0  # categoryが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be greater than or equal to 2")
    end
    it 'conditionが2未満では登録できない' do
      @item.condition_id = 0  # conditionが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be greater than or equal to 2")
    end
    it 'shipping_feeが2未満では登録できない' do
      @item.shipping_fee_id = 0  # shipping_feeが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be greater than or equal to 2")
    end    
    it 'prefectureが2未満では登録できない' do
      @item.prefecture_id = 0  # prefectureが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be greater than or equal to 2")
    end
    it 'delivery_timeが2未満では登録できない' do
      @item.delivery_time_id = 0  # delivery_timeが1未満の値にする
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be greater than or equal to 2")
    end
    it 'priceが半角以外では登録できない' do
      @item.price = '１２３'  # priceの値を全角にする
      @item.valid?
      expect(@item.errors[:price]).to include("は¥300〜¥9,999,999の範囲で入力してください")
    end
    
    it 'priceが¥300~¥9,999,999の間以外では登録できない' do
      @item.price = '100'  # priceの値を¥300~¥9,999,999の間にする
      @item.valid?
      expect(@item.errors[:price]).to include("は¥300〜¥9,999,999の範囲で入力してください")
    end
  end
end
end