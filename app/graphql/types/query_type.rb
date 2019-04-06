module Types
    class QueryType < BaseObject
        field :address,[AddressType], null: false
        def address
            Address.all
        end
        field :intervention,[InterventionType], null: false do
            argument :id, Int, required: false
          end
          def intervention(id: nil)
            if id
                Intervention.where(id: id)
            else
                Intervention.all
            end
          end

        field :building, [BuildingType], null: false do
            argument :id, Int, required: false
          end
          def building(id: nil)
            if id
                Building.where(id: id)
            else
                Building.all
            end
          end

          field :building_detail,[BuildingdetailType], null: false do
            argument :id, Int, required: false
        end
        def building_detail(id: nil)
            if id
                BuildingDetail.where(id: id)
            else
                BuildingDetail.all
            end
        end


        field :administrator,[AdministratorType], null: false do
            argument :id, Int, required: false
          end
        def administrator(id: nil)
            if id
                Administrator.where(id: id)
            else
                Administrator.all
            end
        end


        field :customer,[CustomerType], null: false
        def customer
            Customer.all
        end
        
end
  end

  