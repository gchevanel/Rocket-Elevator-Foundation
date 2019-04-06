
      SELECT extract(YEAR FROM creation_date) AS YEAR, extract(MONTH FROM creation_date) AS MONTH, COUNT(id)
      FROM factcontacts
      GROUP BY  YEAR, MONTH
      ORDER BY  YEAR, MONTH

    