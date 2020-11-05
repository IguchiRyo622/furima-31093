FactoryBot.define do
  factory :item_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone { '00000000000' }
  end
end
