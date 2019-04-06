
class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.belongs_to :battery
      t.integer :battery_id
      t.string :column_type
      t.string :floor_number
      t.string :status
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end

