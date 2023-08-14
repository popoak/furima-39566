class PurchaseShipping
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'should be in the format XXX-XXXX' }
  validates :prefecture_id, :city, :address, :token, :user_id, :item_id, presence: true
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/, message: 'should be 10 or 11 digits' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel: tel, purchase_id: purchase.id)
  end
end