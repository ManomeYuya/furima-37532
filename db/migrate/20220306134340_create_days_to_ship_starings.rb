class CreateDaysToShipStarings < ActiveRecord::Migration[6.0]
  def change
    create_table :days_to_ship_starings do |t|

      t.timestamps
    end
  end
end
