FactoryBot.define do
  factory :item do
    item_name         {'ビール'}
    explanation         {'新鮮なビール'}
    price                   {5000}
    item_condition_id   {2}
    delivery_fee_id       {2}
    delivery_zone_id      {2}
    category_id             {2}
    delivery_time_id        {2}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
