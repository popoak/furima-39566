class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :Prefecture
  belongs_to :delivery_time
  belongs_to :user

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  # 商品名が必須であることを検証する
  validates :name, presence: true
  # 商品の説明が必須であることを検証する
  validates :description, presence: true
   # 商品の状態が必須であることを検証する
   validates :condition_id, presence: true
  # 価格が必須であることを検証する
  validates :price, presence: true
   # 価格の範囲を検証する
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
   # 発送元の地域が必須であることを検証する
  validates :prefecture_id, presence: true
   # 配送料の負担が必須であることを検証する
   validates :shipping_fee_id, presence: true
   # 発送までの日数が必須であることを検証する
  validates :delivery_time_id, presence: true

end
