module Types
    class AdministratorType < BaseObject
        field :id, Int, null: false
        field :first_name, String, null: false
        field :interventions, [InterventionType], null: true
        field :last_name, String, null: true
        field :email, String, null: false
    end
  end