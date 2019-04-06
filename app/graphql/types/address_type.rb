module Types
    class AddressType < BaseObject
      field :id, Int, null: false
      field :street_number_name, String, null: false
      field :city, String, null: false
      field :state_province, String, null: false
      field :zip_code, String, null: false
    end
  end