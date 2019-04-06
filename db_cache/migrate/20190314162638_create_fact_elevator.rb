class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.string :elevator_id
      t.string :serial_number
      t.string :commissioning_date
      t.string :building_id
      t.string :customer_id
      t.string :city_of_building
    end
  end
end
