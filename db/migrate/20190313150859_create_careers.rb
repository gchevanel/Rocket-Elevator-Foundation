class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :position
      t.string :expected_salary
      t.date :start_date
      t.text :experience
      t.binary :attachment
      t.timestamps
    end
  end
end
