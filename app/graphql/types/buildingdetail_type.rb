module Types
    class BuildingdetailType < BaseObject
        field :id, Int, null: false
        field :information_key, String, null: false
        field :value, String, null: false
    end
  end