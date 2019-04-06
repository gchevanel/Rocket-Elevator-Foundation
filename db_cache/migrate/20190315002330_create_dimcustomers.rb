class CreateDimcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.string :creation_date
      t.string :company_name
      t.string :name_of_company_contact
      t.string :email_company
      t.string :nb_elevators
      t.string :customer_city
    end
  end
end

