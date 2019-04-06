module Types
    class BuildingType < BaseObject
        field :id, Int, null: false
        field :customer, CustomerType, null: false
        field :interventions, [InterventionType], null: true
        field :building_details, [BuildingdetailType], null: true
        field :address, AddressType, null: false
        field :building_administrator_full_name, String, null: false
    end
  end