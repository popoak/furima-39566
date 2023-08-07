class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :Prefecture
  belongs_to :delivery_time
  belongs_to :user

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { greater_than_or_equal_to: 2, message: "must be greater than or equal to 2" } 
  validates :condition_id, numericality: { greater_than_or_equal_to: 2, message: "must be greater than or equal to 2" }
  validates :prefecture_id, numericality: { greater_than_or_equal_to: 2, message: "must be greater than or equal to 2" } 
  validates :shipping_fee_id, numericality: { greater_than_or_equal_to: 2, message: "must be greater than or equal to 2" }
  validates :delivery_time_id, numericality: { greater_than_or_equal_to: 2, message: "must be greater than or equal to 2" }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "は半角数字のみで入力してください" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は¥300〜¥9,999,999の範囲で入力してください" }
end
