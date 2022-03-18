class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :purchase_management
  has_one_attached :image
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :product_condition
  belongs_to :burden_of_shipping_charge
  belongs_to :delivery_area
  belongs_to :days_to_ship_staring


  validates :item_explanation, presence: true
  validates :item_name, presence: true
  validates :image, presence: true
  validates :price, presence: true


  validates :category_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :burden_of_shipping_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :days_to_ship_staring_id, numericality: { other_than: 1 }


  
  validates :price, numericality: {only_integer: true, message: '価格は半角数値のみ使用してください'} 
  validates :price, numericality:  {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '価格は¥300~9,999,999の間で設定してください' } 
end


