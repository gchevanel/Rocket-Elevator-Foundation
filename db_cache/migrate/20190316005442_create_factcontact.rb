class CreateFactcontact < ActiveRecord::Migration[5.2]
  def change
    create_table :factcontacts do |t|

      t.string :contact_id
      t.timestamp :creation_date
      t.string :company_name
      t.string :email
      t.string :project_name
      
    end
  end
end


