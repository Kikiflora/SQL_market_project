/*Отличаются ли средняя цена за кг и средний объём продажи между 
	строками с discount = Yes и discount = No, и какая из групп даёт больше 
	суммарной выручки?*/
    
/*Are there differences in the average price per kg and the average sales volume between 
    rows where discount = Yes and discount = No,and which group generates more 
    total revenue?*/

    SELECT
        is_discount,
        ROUND(AVG(unit_price), 2) AS price,
        ROUND(AVG(quantity_kg), 3) AS weight,
        ROUND(SUM(quantity_kg * unit_price), 2) AS revenue
    FROM sales
    WHERE sale_type = 'sale'
    GROUP BY 
        is_discount

/*
[
  {
    "is_discount": false,
    "price": "9.03",
    "weight": "0.529",
    "revenue": "3210892.02"
  },
  {
    "is_discount": true,
    "price": "7.01",
    "weight": "0.670",
    "revenue": "161131.32"
  }
]
*/