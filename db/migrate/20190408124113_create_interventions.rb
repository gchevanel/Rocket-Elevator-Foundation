class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :Author
      t.integer :Customer_id
      t.integer :Building_id
      t.integer :Battery_id
      t.integer :Column_id
      t.integer :Elevator_id
      t.integer :Employee_id
      t.datetime :InterventionStartingDate
      t.datetime :InterventionFinishedDate
      t.string :Result
      t.string :Report
      t.string :Statut

      t.timestamps
    end
  end
end
