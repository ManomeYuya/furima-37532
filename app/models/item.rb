class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :purchase_management
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :burden_of_shipping_charge
  belongs_to :delivery_area
  belongs_to :days_to_ship_staring


  validates :item_explanation, presence: true
  validates :item_name, presence: true
  validates :image, presence: true


  validates :category_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :burden_of_shipping_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :days_to_ship_staring_id, numericality: { other_than: 1 }


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '価格は半角数値のみ使用してください' } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end
end

