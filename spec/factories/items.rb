FactoryBot.define do
  factory :item do
    association :user
    association :product_condition
    association :category
    association :burden_of_shipping_charge
    association :delivery_area
    association :days_to_ship_staring

    item_name                   {'test'}
    item_explanation            {'test'}
    price                       {'30000'}
    category_id                   {2}
    product_condition_id          {2}
    burden_of_shipping_charge_id  {2}
    delivery_area_id              {2}
    days_to_ship_staring_id       {2}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
