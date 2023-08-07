FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    description       { 'これはテスト商品です。' }
    price             { 1000 }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    association :user, factory: :user
  end
end
