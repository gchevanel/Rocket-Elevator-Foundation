class CreateFactquote < ActiveRecord::Migration[5.2]
  def change
    create_table :factquotes do |t|
     t.string :quote_id
     t.timestamp :creation_date
     t.string :name
     t.string :email
     t.string :nbelevators
    end
  end
end
