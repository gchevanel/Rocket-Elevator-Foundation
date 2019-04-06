
class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.belongs_to :column
      t.integer :column_id
      t.string :serial_number
      t.string :elevator_class
      t.string :elevator_type
      t.string :notes
      t.string :status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.timestamps
    end
  end
end

