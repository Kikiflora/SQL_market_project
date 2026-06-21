/*В какой час суток (0-23) и в какой день недели магазин получает 
	наибольшее количество транзакций и наибольший суммарный объём продаж в кг?*/
    
/*At what hour of the day (0–23) and on what day of the week does the store record 
    the highest number of transactions and the highest total sales volume in kilograms?*/

--Запрос с часами / Query with hours
SELECT 
    EXTRACT(HOUR FROM sale_time) AS hour,
    COUNT(*) AS sales,
    SUM (quantity_kg) AS total_kg
FROM sales
WHERE sale_type = 'sale'
GROUP BY 
    EXTRACT(HOUR FROM sale_time)
ORDER BY
    sales DESC
;




--Запрос с днями / Query with days
SELECT 
    EXTRACT(ISODOW FROM sale_date) AS day_number,
    COUNT(*) AS sales,
    SUM (quantity_kg) AS total_kg
FROM sales
WHERE sale_type = 'sale'
GROUP BY 
    EXTRACT(ISODOW FROM sale_date)
ORDER BY
     sales DESC

/*
[
  {
    "hour": "10",
    "sales": "120882",
    "total_kg": "64175.632"
  },
  {
    "hour": "11",
    "sales": "94702",
    "total_kg": "50393.723"
  },
  {
    "hour": "17",
    "sales": "92751",
    "total_kg": "49008.163"
  },
  {
    "hour": "18",
    "sales": "89735",
    "total_kg": "46500.421"
  },
  {
    "hour": "16",
    "sales": "82722",
    "total_kg": "43998.522"
  },
  {
    "hour": "9",
    "sales": "74028",
    "total_kg": "39365.279"
  },
  {
    "hour": "19",
    "sales": "62233",
    "total_kg": "33774.405"
  },
  {
    "hour": "15",
    "sales": "62078",
    "total_kg": "33436.247"
  },
  {
    "hour": "20",
    "sales": "53364",
    "total_kg": "30644.302"
  },
  {
    "hour": "12",
    "sales": "49147",
    "total_kg": "26405.520"
  },
  {
    "hour": "14",
    "sales": "41765",
    "total_kg": "22880.365"
  },
  {
    "hour": "13",
    "sales": "35568",
    "total_kg": "19305.986"
  },
  {
    "hour": "21",
    "sales": "18809",
    "total_kg": "11216.445"
  },
  {
    "hour": "22",
    "sales": "257",
    "total_kg": "170.438"
  },
  {
    "hour": "8",
    "sales": "1",
    "total_kg": "0.391"
  }
]
*/











/*
[
  {
    "day_number": "6",
    "sales": "158841",
    "total_kg": "85791.596"
  },
  {
    "day_number": "7",
    "sales": "155541",
    "total_kg": "82754.786"
  },
  {
    "day_number": "5",
    "sales": "120944",
    "total_kg": "66205.723"
  },
  {
    "day_number": "1",
    "sales": "112892",
    "total_kg": "60485.879"
  },
  {
    "day_number": "3",
    "sales": "111950",
    "total_kg": "59400.835"
  },
  {
    "day_number": "2",
    "sales": "109648",
    "total_kg": "58288.114"
  },
  {
    "day_number": "4",
    "sales": "108226",
    "total_kg": "58348.906"
  }
]
*/