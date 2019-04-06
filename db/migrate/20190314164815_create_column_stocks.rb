class CreateColumnStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :column_stocks do |t|
      t.string :doors
      t.string :cables
      t.string :displays
      t.string :callbuttons
      t.string :bearings

      t.timestamps
    end
  end
end
