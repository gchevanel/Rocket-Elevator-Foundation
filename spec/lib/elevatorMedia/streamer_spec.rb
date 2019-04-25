require 'net/http'
require 'spec_helper'
require 'rails_helper'
require 'elevatorMedia/streamer'

describe Streamer do  

    let!(:streamer){Streamer.new}


        context 'Quebec weather' do 
            it 'Current City Weather' do
                currentCityWeather = streamer.GetCityWeather['weather'][0]
                expect(currentCityWeather).to_not eq(nil)

            end
            it 'Current City Weather' do
                currentCityIdWeather = streamer.GetCityIdWeather['weather'][0]
                expect(currentCityIdWeather).to_not eq(nil)
            end
            
            it 'Current Weather' do
                currentGeocodeWeather = streamer.GetGeocodeWeather['weather'][0]
                expect(currentGeocodeWeather).not_to be_empty
                expect(currentGeocodeWeather.size).to eq(4)
            end
        end


        it 'chuck norris' do
            expect(subject.chucknorris).to_not eq(nil)
        end

        it 'chuck norris' do
            expect(subject.chucknorris).to_not have_http_status(404)
        end
        it 'Spotify' do
            expect(subject.SpotifyMusic).to_not eq(nil)
        end

        it "should  respond to getContent" do
            expect(streamer).to respond_to(:getContent)
        end


        describe 'Get content behavior' do
            
            it 'return valid html' do

                result = streamer.getContent()
                expect(result).to be_a(String)
                expect(result).to include('<')
            end
            it 'should get html from internet' do
                expect(streamer).to receive(:getHtmlResult)
                streamer.getContent()
            end
            it 'should get chuck norris joke' do
                expect(streamer).to receive(:chucknorris).and_return({value: {joke: 'this is a joke'}}.to_json)
                streamer.getContent()
            end
            it 'should get real joke' do
                json_response = JSON.parse(streamer.chucknorris)["icon_url"]
                p json_response
                expect(json_response)
            end
            it 'should get real joke' do
                json_response = JSON.parse(streamer.chucknorris)["value"]
                p json_response
                expect(json_response)
            end
            
        end


end