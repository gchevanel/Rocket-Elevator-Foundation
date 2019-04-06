class Intervention < ApplicationRecord
    belongs_to :building
    establish_connection :development_pg
    self.table_name = 'fact_interventions'
end
