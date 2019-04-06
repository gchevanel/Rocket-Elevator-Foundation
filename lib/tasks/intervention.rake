require 'pg'
namespace :fact do
    desc "Send mysql information to data warehouse in factintervention table"

    task intervention: :environment do
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "samuel_asselin", user: "codeboxx", password: "Codeboxx1!")

        conn.exec ("TRUNCATE fact_interventions RESTART IDENTITY")
        Building.first(30).each do |building|
            query = ("INSERT INTO \"fact_interventions\" (building_id, employee_id, timestart)
            VALUES (#{building.id}, '#{building.customer_id}', '#{building.batteries[0].columns[0].elevators[0].updated_at}')")

            p query
 
            conn.exec (query)
        end
            
    end    
end