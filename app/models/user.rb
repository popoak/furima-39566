class User < ApplicationRecord
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください。" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください。" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください。" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください。" }
  validates :encrypted_password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[0-9]).+\z/, message: "は半角英数字混合で入力してください。" }
  validates :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable       
end
