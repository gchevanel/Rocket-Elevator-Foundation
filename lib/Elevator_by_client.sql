     
        SELECT 
          company_name, nb_elevators

        FROM 
          dimcustomers
        GROUP BY
          company_name, nb_elevators
        ORDER BY
          nb_elevators;

   