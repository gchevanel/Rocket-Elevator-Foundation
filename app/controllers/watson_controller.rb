class WatsonController < ApplicationController

    def watson

        uri = URI.parse("https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize")
        request = Net::HTTP::Post.new(uri)
        request.basic_auth("apikey",ENV["watsonkey"])
        request.content_type = "application/json"
        request["Accept"] = "audio/wav"
        username = params['user_name']
        lastname = params['last_name']
        request.body = JSON.dump({
        "text" => "Hi #{username}" + "Welcome to Rocket Elevator admin panel, there are currently #{Elevator.all.size}
        elevators deployed in the #{Building.all.size} buildings of your #{Customer.all.size} customers, currently,
        #{Elevator.inactivecount} elevators are not in Running Status and are being serviced, you currently have #{Quote.all.size} quotes awaiting processing,
        You currently have #{Lead.all.size} leads in your contact requests, #{Battery.all.size} batteries are deployed across #{Address.all.size} cities"  
        })

        req_options = {
        use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
        end

        send_data response.body

    end

    
end


