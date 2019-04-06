module Types
    class CustomerType < BaseObject
        field :id, Int, null: false
        field :administrator, AdministratorType, null: true
        field :address_id, Int, null: false
        field :phone, String, null: false
        field :company_name, String, null: false
        field :full_name, String, null: false
        field :email, String, null: false
    end
  end