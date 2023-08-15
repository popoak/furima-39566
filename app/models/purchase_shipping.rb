class PurchaseShipping
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は正しい形式で入力してください' }
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁で入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel: tel, purchase_id: purchase.id)
  end
end