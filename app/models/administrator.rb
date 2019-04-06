class Administrator < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
  has_many :interventions, foreign_key: :employee_id
  has_many :customer


end
