class CreateElevatorStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :elevator_stocks do |t|
      t.string :standard
      t.string :premium
      t.string :excelium
      t.string :doors
      t.string :displays
      t.string :buttons
      t.string :safety_gears

      t.timestamps
    end
  end
end
