require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'priceとtokenがあれば保存ができること' do
        expect(@purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
      @purchase
        expect(@purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code should be in the format XXX-XXXX")
      end
      it '郵便番号が3桁-4桁でないと保存できないこと' do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code should be in the format XXX-XXXX")
      end
      it 'cityが空だと保存できないこと' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase.prefecture_id = nil
        expect(@purchase).not_to be_valid
      end
      it 'telが空だと保存できないこと' do
        @purchase.tel = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁以上から11桁以内でないと保存できないこと' do
        @purchase.tel = "123456789012" # 10桁の番号
        expect(@purchase).not_to be_valid
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase.user_id = nil
        expect(@purchase).not_to be_valid
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase.item_id = nil
        expect(@purchase).not_to be_valid
      end
    end
  end
end
