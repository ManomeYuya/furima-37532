FactoryBot.define do
  factory :purchase_management_address do
    post_code { '123-4567' }
    delivery_area_id {2}
    municipality { '横浜市緑区' }
    house_number { '青山1-11-1' }
    building_name { '柳ビル101' }
    telephone_number { '08000000000' }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end