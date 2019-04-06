class Elevator < ApplicationRecord
    before_update :notification
    belongs_to :column
    
    def notification
        if self.status_changed?
            slack_notification()
        end
        if status == "Intervention"
            twilio_sms()
        end
    end    


    def twilio_sms
        account_sid = ENV['twiliosid']
        auth_token = ENV['twiliotoken']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['fromnum'] # Your Twilio number
        to = column.battery.building.building_technical_contact_phone # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "the elevator # " + id.to_s + " Serial Number : " + serial_number.to_s + " At : "+ column.battery.building.address.street_number_name.to_s + " City : " + column.battery.building.address.city + " Status : "+ status 
        )
    end
    def slack_notification
        require 'date'
          current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
          notifier = Slack::Notifier.new ENV["slackkey"], channel: "#botsam", username: "notifier"
          notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{current_time}."
      end

    def self.inactivecount
        Elevator.where(status: 'inactive').count
    end
end      

