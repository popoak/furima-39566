FactoryBot.define do
  factory :purchase_shipping do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    tel { '09012345678' }
    token { 'abc123' }
  end
end
