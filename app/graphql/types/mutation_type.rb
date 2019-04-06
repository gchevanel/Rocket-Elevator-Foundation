module Types
    class MutationType < BaseObject
        field :address,[AddressType], null: false
        field :intervention,[InterventionType], null: false
        field :administrator,[AdministratorType], null: false
        field :customer,[CustomerType], null: false
        field :building,[BuildingType], null: false
        field :buildingdetail,[BuildingdetailType], null: false
    end
  end
