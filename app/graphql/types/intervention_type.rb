module Types
    class InterventionType < BaseObject
        field :id, Int, null: false
        field :employee_id, Int, null: false
        field :building, BuildingType, null: false
        field :timestart, String, null: false
        field :timefinish, String, null: true
    end
  end