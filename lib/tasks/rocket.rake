require 'pg'
namespace :rocket do

   desc "export to postgresql"
   task dwh: :environment do

    conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "samuel_asselin", user: "codeboxx", password: "Codeboxx1!")

       conn.exec ("TRUNCATE factquotes RESTART IDENTITY")
       Quote.all.each do |quote|
           conn.exec("INSERT INTO \"factquotes\" (quote_id, creation_date, name, email, nbelevators)
           VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.Company_Name}', '#{quote.Email}', '#{quote.Nb_Cage}')")
       end

        conn.exec ("TRUNCATE factcontacts RESTART IDENTITY")
        Lead.all.each do |lead|
            conn.exec("INSERT INTO \"factcontacts\" (contact_id, creation_date, company_name, email, project_name)
            VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.business_name}', '#{lead.email}', '#{lead.project_name}')")
       end

        conn.exec ("TRUNCATE fact_elevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
           conn.exec("INSERT INTO \"fact_elevators\" (elevator_id, serial_number, commissioning_date, building_id, customer_id, city_of_building)
           VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
       end

        conn.exec("TRUNCATE dimcustomers RESTART IDENTITY")
        Customer.all.each do |customer|
            nb_elevators = 0
            customer.buildings.all.each do |building|
               
                building.batteries.all.each do |battery|
                    
                    battery.columns.all.each do |column|
                      
                      nb_elevators += column.elevators.count
                           
                    end
                end
            end

            conn.exec ("INSERT INTO \"dimcustomers\" (creation_date, company_name, name_of_company_contact, email_company, nb_elevators, customer_city)
            VALUES ('#{customer.created_at}', '#{customer.company_name}', '#{customer.full_name}', '#{customer.email}', #{nb_elevators}, '#{customer.address.city}')")
            
        end


   end
end






















