
      SELECT extract(YEAR FROM creationdatecompany) AS YEAR, extract(MONTH FROM creationdatecompany) AS MONTH, COUNT(id)
      FROM factquotes
      GROUP BY  YEAR, MONTH
      ORDER BY  YEAR, MONTH

 
