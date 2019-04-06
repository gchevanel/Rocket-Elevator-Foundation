
class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.belongs_to :address
      #t.integer :address_id
      t.string :company_name
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :company_description
      t.string :full_name_of_service_technical
      t.string :phone_of_service_technical
      t.string :email_of_service_technical
      t.timestamps
      
    end
  end
end

