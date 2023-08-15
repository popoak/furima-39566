require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)  # Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録が登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  context 'ユーザー新規登録ができない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'aaa'  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end
    # passwordが空では登録できないことをテスト
    it 'passwordが空では登録できない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'aaaa'  # passwordの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaa'  # passwordの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '1234'  # passwordの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ああ'  # passwordの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      @user.password = ''  # passwordの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end 

    it 'last_nameが空では登録できない' do
      @user.last_name = ''  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください")
    end
    it 'last_nameが全角以外では登録できない' do
      @user.last_name = 'taro'  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("姓は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end
    it 'first_nameが全角以外では登録できない' do
      @user.first_name = 'taro'  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end
    it 'last_nameが全角以外では登録できない' do
      @user.last_name = 'taro'  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("姓は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end
    it 'first_nameが全角以外では登録できない' do
      @user.first_name = 'aa'  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("姓(カナ)を入力してください")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''  # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)を入力してください")
    end
    it 'last_name_kanaが全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'ああ'  # カナ名字を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("姓(カナ)は全角（カタカナ）で入力してください。")
    end
    it 'お名前カナ(全角)が名字と名前がそれぞれ必須であり、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'ああ'  # カナ名字を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)は全角（カタカナ）で入力してください。")
    end
    # 生年月日が必須であることをテスト
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
   end
  end
end