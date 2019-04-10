json.extract! intervention, :id, :Author, :CustomerID, :BuildingID, :BatteryID, :ColumnID, :ElevatorID, :EmployeeID, :InterventionStartingDate, :InterventionFinishedDate, :Result, :Report, :Statut, :created_at, :updated_at
json.url intervention_url(intervention, format: :json)
