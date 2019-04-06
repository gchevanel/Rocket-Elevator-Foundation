class Customer < ApplicationRecord
    belongs_to :address
    has_many :buildings
    belongs_to :administrator, foreign_key: :user_id
end
