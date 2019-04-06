class Quote < ApplicationRecord

            # ZendeskAPI::Ticket.create!($client, 
            #     :subject => "#{self.Full_Name} from #{self.Company_Name}", 
            #     :comment => "The contact #{self.Full_Name} from company #{self.Company_Name} can be reached at email #{self.Email} and at phone number #{self.Phone_Number}.
            #     The building type was #{self.Building_Type} with product grade #{self.Product_Grade} with a cost of #{self.Final_Price}."
            #     )
end
