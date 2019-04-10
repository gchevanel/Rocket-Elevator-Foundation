class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :Author
      t.integer :Customer_id
      t.integer :BuildingID
      t.integer :BatteryID
      t.integer :ColumnID
      t.integer :ElevatorID
      t.integer :EmployeeID
      t.datetime :InterventionStartingDate
      t.datetime :InterventionFinishedDate
      t.string :Result
      t.string :Report
      t.string :Statut

      t.timestamps
    end
  end
end
