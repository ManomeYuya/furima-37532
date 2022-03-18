class PurchaseManagementAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :municipality, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality, :telephone_number, :house_number,:user_id, :item_id, :token
    validates :post_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: { other_than: 1 }
  end

  validates :telephone_number, numericality: {only_integer: true} ,length: { in: 10..11}


  def save
    purchase_management = PurchaseManagement.create(user_id:user_id, item_id:item_id)
    Address.create(post_code: post_code, delivery_area_id:delivery_area_id, municipality:municipality, house_number:house_number, building_name:building_name, telephone_number:telephone_number, purchase_management_id: purchase_management.id)
  end

 
end

