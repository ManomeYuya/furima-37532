class CreateBurdenOfShippingCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :burden_of_shipping_charges do |t|

      t.timestamps
    end
  end
end
