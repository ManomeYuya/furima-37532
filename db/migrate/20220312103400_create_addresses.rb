class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
    t.references :purchase_management,null: false, foreign_key: true  
    t.string :post_code, null: false 
    t.integer :delivery_area_id, null: false 
    t.string :municipality, null: false 
    t.string  :house_number,   null: false 
    t.string  :building_name   
    t.string  :telephone_number, null: false 

    t.timestamps
    end
  end
end
