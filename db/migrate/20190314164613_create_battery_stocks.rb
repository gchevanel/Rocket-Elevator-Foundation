class CreateBatteryStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :battery_stocks do |t|
      t.string :boards
      t.string :batteries

      t.timestamps
    end
  end
end
