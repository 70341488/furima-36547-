FactoryBot.define do
  factory :purchase_residence do
    municipalities {'東京都'}
    address {'1-1'}
    post_number {'123-4567'}
    phone_number {'09012345678'}
    delivery_zone_id { 1 }
    building_name {'東京ハイツ'}
    item_id { 1 }
    purchase_id { 1 }
  end
end