# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'addresses.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING ADDRESS"
    p row
    t = Address.new
    t.address_type = row['address_type']
    t.status = row['status']
    t.entity = row['entity']
    t.street_number_name = row['street_number_name']
    t.apartment_number = row['apartment_number']
    t.city = row['city']
    t.state_province = row['state_province']
    t.zip_code = row['zip_code']
    t.country = row['country']
    t.notes = row['notes']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.street_number_name}, #{t.city} saved"
end

puts "There are now #{Address.count} rows in the transactions table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'userlist.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Administrator.new
    t.email= row['email']
    t.password_digest = row['password_digest']
    t.first_name = row['first_name']
    t.last_name = row['last_name']
    t.title = row['title']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
   
    t.save!

    puts "#{t.email}, #{t.last_name} saved"
end

puts "There are now #{Administrator.count} rows in the transactions table"




require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'customers.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING CUSTOMERS"
    p row
    t = Customer.new
    t.user_id = row['user_id']
    t.company_name = row['company_name']
    t.address_id = row['address_id']
    t.full_name = row['full_name']
    t.phone = row['phone']
    t.email = row['email']
    t.company_description = row['company_description']
    t.full_name_of_service_technical = row['full_name_of_service_technical']
    t.phone_of_service_technical = row['phone_of_service_technical']
    t.email_of_service_technical = row['email_of_service_technical']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.user_id}, #{t.full_name} saved"
end

puts "There are now #{Customer.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'leads.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING LEAD"
    p row
    t = Lead.new
    t.customer_id = row['customer_id']
    t.full_name= row['full_name']
    t.email = row['email']
    t.phone = row['phone']
    t.business_name = row['business_name']
    t.project_name = row['project_name']
    t.department = row['department']
    t.project_description = row['project_description']
    t.message = row['message']
    t.file_attachment = row['file_attachment']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.business_name}, #{t.message} saved"
end

puts "There are now #{Lead.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'buildings.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING BUILDING"
    p row
    t = Building.new
    t.customer_id= row['customer_id']
    t.address_id = row['address_id']
    t.building_administrator_full_name = row['building_administrator_full_name']
    t.building_administrator_email = row['building_administrator_email']
    t.building_administrator_phone = row['building_administrator_phone']
    t.building_technical_contact_name = row['building_technical_contact_name']
    t.building_technical_contact_email = row['building_technical_contact_email']
    t.building_technical_contact_phone = row['building_technical_contact_phone']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.customer_id}, #{t.building_administrator_full_name} saved"
end

puts "There are now #{Building.count} rows in the transactions table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'batteries.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING BATTERIES"
    p row
    t = Battery.new
    t.building_id= row['building_id']

    t.battery_type = row['battery_type']

    t.status = row['status']
    t.employee_id = row['employee_id']
    t.date_of_commissioning = row['date_of_commissioning']
    t.last_inspection_date = row['last_inspection_date']
    t.operations_certificate = row['operations_certificate']
    t.information = row['information']
    t.notes = row['notes']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.date_of_commissioning}, #{t.information} saved"
end

puts "There are now #{Battery.count} rows in the transactions table"

require 'csv'


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'columns.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING COLUMN"
    p row
    t = Column.new
    t.battery_id= row['battery_id']

    t.column_type = row['column_type']
    t.floor_number = row['floor_number']
    t.status = row['status']
    t.information = row['information']
    t.notes = row['notes']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.battery_id}, #{t.status} saved"
end

puts "There are now #{Column.count} rows in the transactions table"


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'elevators.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING ELEVATOR"
    p row
    t = Elevator.new
    t.column_id= row['column_id']
    t.serial_number = row['serial_number']
    t.elevator_class = row['elevator_class']
    t.elevator_type = row['elevator_type']
    t.status = row['status']
    t.date_of_commissioning = row['date_of_commissioning']
    t.date_of_last_inspection = row['date_of_last_inspection']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.column_id}, #{t.elevator_class} saved"
end

puts "There are now #{Elevator.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'employee.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Employee.new
    t.full_name= row['full_name']
    t.phone = row['phone']
    t.email = row['email']
    t.SIN = row['SIN']
    t.insurer = row['insurer']
    t.insurance_type = row['insurance_type']
    t.vacancy_days_left = row['vacancy_days_left']
    t.YTD_hour = row['YTD_hour']
    t.YTD = row['YTD']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.full_name}, #{t.insurance_type} saved"
end

puts "There are now #{Employee.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'building_details.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p "CREATING BUILDING DETAILS"
    p row
    t = BuildingDetail.new
    t.building_id= row['building_id']
    t.information_key = row['information_key']
    t.value = row['value']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.building_id}, #{t.value} saved"
end

puts "There are now #{BuildingDetail.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'battery_stock.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = BatteryStock.new
    t.boards= row['boards']
    t.batteries = row['batteries']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.boards}, #{t.batteries} saved"
end

puts "There are now #{BatteryStock.count} rows in the transactions table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'elevator_stock.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = ElevatorStock.new
    t.standard= row['standard']
    t.premium = row['premium']
    t.excelium = row['excelium']
    t.doors = row['doors']
    t.displays = row['displays']
    t.buttons = row['buttons']
    t.safety_gears = row['safety_gears']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.standard}, #{t.buttons} saved"
end

puts "There are now #{ElevatorStock.count} rows in the transactions table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'column_stock.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = ColumnStock.new
    t.doors= row['doors']
    t.cables = row['cables']
    t.displays = row['displays']
    t.callbuttons = row['callbuttons']
    t.bearings = row['bearings']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.doors}, #{t.bearings} saved"
end

puts "There are now #{ColumnStock.count} rows in the transactions table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'subscription.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Subscription.new
    t.subscription= row['subscription']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.subscription}, #{t.created_at} saved"
end

puts "There are now #{Subscription.count} rows in the transactions table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'quote.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Quote.new
    t.Full_Name= row['Full_Name']
    t.Phone_Number = row['Phone_Number']
    t.Company_Name = row['Company_Name']
    t.Email = row['Email']
    t.Building_Type = row['Building_Type']
    t.Product_Grade = row['Product_Grade']
    t.Nb_Appartement = row['Nb_Appartement']
    t.Nb_Business = row['Nb_Business']
    t.Nb_Floor = row['Nb_Floor']
    t.Nb_Basement = row['Nb_Basement']
    t.Nb_Cage = row['Nb_Cage']
    t.Nb_Parking = row['Nb_Parking']
    t.Nb_OccupantPerFloor = row['Nb_OccupantPerFloor']
    t.Nb_OpperatingHour = row['Nb_OpperatingHour']
    t.Final_Price = row['Final_Price']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!

    puts "#{t.Company_Name}, #{t.Nb_Cage} saved"
end

puts "There are now #{Quote.count} rows in the transactions table"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'careers.csv'))
csv = CSV.parse(csv_text, col_sep: ",", :headers => true)
csv.each do |row|
    
    row = row.to_hash
    p row
    t = Career.new
    t.first_name= row['first_name']
    t.last_name = row['last_name']
    t.email = row['email']
    t.phone = row['phone']
    t.position = row['position']
    t.expected_salary = row['expected_salary']
    t.start_date = row['start_date']
    t.experience = row['experience']
    t.attachment = row['attachment']
    
    t.save!

    puts "#{t.first_name}, #{t.position} saved"
end

puts "There are now #{Career.count} rows in the transactions table"
