require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    # passwordが空では登録できないことをテスト
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = ''  # passwordの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    # お名前(全角)が名字と名前がそれぞれ必須であり、全角（漢字・ひらがな・カタカナ）での入力が必須であることをテスト
    it 'お名前(全角)が名字と名前がそれぞれ必須であり、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name = ''  # 名字を空にする
      user.first_name = ''  # 名前を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")

      user.last_name = 'kk'  # 有効な名字を設定（全角漢字）
      user.first_name = 'kk'  # 有効な名前を設定（全角漢字）
      user.valid?
      expect(user.errors.full_messages).not_to include("Last name can't be blank", "First name can't be blank")

      user.last_name = 'やまだ'  # 有効な名字を設定（全角ひらがな）
      user.first_name = 'たろう'  # 有効な名前を設定（全角ひらがな）
      user.valid?
      expect(user.errors.full_messages).not_to include("Last name can't be blank", "First name can't be blank")

      user.last_name = 'ヤマダ'  # 有効な名字を設定（全角カタカナ）
      user.first_name = 'タロウ'  # 有効な名前を設定（全角カタカナ）
      user.valid?
      expect(user.errors.full_messages).not_to include("Last name can't be blank", "First name can't be blank")
    end

    # お名前カナ(全角)が名字と名前がそれぞれ必須であり、全角（カタカナ）での入力が必須であることをテスト
    it 'お名前カナ(全角)が名字と名前がそれぞれ必須であり、全角（カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name_kana = ''  # カナ名字を空にする
      user.first_name_kana = ''  # カナ名前を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")

      user.last_name_kana = 'ヤマダ'  # 有効なカナ名字を設定（全角カタカナ）
      user.first_name_kana = 'タロウ'  # 有効なカナ名前を設定（全角カタカナ）
      user.valid?
      expect(user.errors.full_messages).not_to include("Last name kana can't be blank", "First name kana can't be blank")
    end

    # 生年月日が必須であることをテスト
    it '生年月日が必須であること' do
      user = FactoryBot.build(:user)
      user.birthday = nil
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")

      user.birthday = Date.today  # 有効な生年月日を設定
      user.valid?
      expect(user.errors.full_messages).not_to include("Birthdate can't be blank")
    end
  end
end