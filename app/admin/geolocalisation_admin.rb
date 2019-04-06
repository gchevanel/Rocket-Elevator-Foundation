Trestle.admin(:geolocalisation) do
    menu do
      group :informations, priority: :last do
      item :geolocalisation, icon: "fa fa-tachometer"
      end
      
    end
  
    controller do
      def index

        @markers = []
        temp_markers = []

        Building.first(30).each do |building|
            customer = building.building_administrator_full_name
            address = building.address
            batteries = building.batteries
            techname = building.building_technical_contact_name
            columns = Column.where(battery_id: batteries.ids)
            elevators = Elevator.where(column_id: columns.ids).count
            nbfloor = columns[0].floor_number

            @localisation = address.street_number_name + " " + address.city + " " + address.zip_code + " "
            temp_markers << {
              address: @localisation,
              customer: customer,
              batteries: batteries.count,
              columns: columns.count,
              elevators: elevators,
              techname: techname,
              nbfloor: nbfloor,
              }
        end
        temp_markers.each do |m|
          @response = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{m[:address]}&key=#{ENV["googlegeo"]}").body)
          if @response["status"] != "ZERO_RESULTS" 
            m[:lat] = @response["results"][0]["geometry"]["location"]["lat"] 
            m[:lng] = @response["results"][0]["geometry"]["location"]["lng"] 
            @markers << m
          end
        end
      end
    end
  end