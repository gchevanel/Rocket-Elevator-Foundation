class Building < ApplicationRecord
    belongs_to :address
    has_many :interventions
    has_many :building_details
    has_many :batteries
    belongs_to :customer
end
