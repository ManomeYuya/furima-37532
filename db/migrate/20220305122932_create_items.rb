class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.text :item_explanation, null: false
      t.string :item_name, null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null:false
      t.integer :burden_of_shipping_charge_id, null:false
      t.integer :delivery_area_id, null:false
      t.integer :days_to_ship_staring_id, null:false
      t.integer :price, null:false


      t.timestamps
    end
  end
end
