require 'open_weather'
require 'rest-client'


class Streamer
    def initialize


    end
    # here is the get content for the chuck norris joke and image url
    def getContent (type='chuck norris')
        getHtmlResult(type)
    end
    def getHtmlResult(type)
        if type == 'chuck norris'
            @chuckjoke = "<div>#{JSON.parse(self.chucknorris)['value']['joke']}</div>"
            return @chuckjoke
        end
    end

    def chucknorris
        @response = RestClient::Request.execute(method: :get, url: ENV['chuckapi'],
            headers: {"Content-type": "application/json"})
            
        
    end
    # spotify

    def SpotifyMusic
        @response = RestClient::Request.execute(method: :get, url: ENV['spotifyapi'],
            headers: {"Content-type": "application/json"})
        
    end
    def SpotifyNameMusic
        @response = RestClient::Request.execute(method: :get, url: ENV['spotifyapi'],
            headers: {"Content-type": "application/json"})
            user = RSpotify::User.find('wizzler')
            return user;
        
    end
# weather
    def GetCityWeather
        # get current weather by city name
        options = { units: "metric", APPID: ENV['weatherapi'] }
        OpenWeather::Current.city("Montreal, ca", options)
        end
    def GetCityIdWeather
        # get current weather by city name
        options = { units: "metric", APPID: ENV['weatherapi'] }
        OpenWeather::Current.city_id("1273874", options)
        end
    def GetGeocodeWeather
        # get current weather by city name
        options = { units: "metric", APPID: ENV['weatherapi'] }
        OpenWeather::Current.geocode(-0.13, 51.51 , options)
    end



end