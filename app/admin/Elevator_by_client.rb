Trestle.admin(:Elevator_by_client) do
    menu do
      group :statistics, priority: :last do
      item :Elevator_by_client, icon: "fa fa-bar-chart"
      end
    end         
    controller do
      def index

        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "samuel_asselin", user: "codeboxx", password: "Codeboxx1!")

        @data1 = conn.exec("SELECT company_name, nb_elevators FROM dimcustomers 
      
        GROUP BY company_name, nb_elevators
        ORDER BY nb_elevators;")

        @x1 = @data1.column_values(0)
        @y1 = @data1.column_values(1)

      end
    end
  end