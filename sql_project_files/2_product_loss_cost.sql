/*Сколько денег магазин теряет на порче/списании товара, если считать, 
что закупленный объём всегда больше проданного на процент потерь? */

/*How much money does the store lose due to spoilage or write-offs, assuming 
that the volume of goods purchased is always greater than the volume sold 
by the loss percentage? */

WITH inform AS (
    SELECT
        s.item_code,
        (quantity_kg / (100 - loss_rate_pct)) * 100 AS buyed_kg, --Закуплено кг
        (quantity_kg / (100 - loss_rate_pct)) * 100 * loss_rate_pct
            AS loss_kg, --Потеряно кг
        (quantity_kg / (100 - loss_rate_pct)) * 100 * loss_rate_pct
        * wholesale_price AS loss_money --Потеряно денег
    FROM 
        prices p
    JOIN sales s ON s.item_code = p.item_code AND 
                    s.sale_date = p.price_date
    JOIN loss_rates lr ON lr.item_code = s.item_code
    WHERE s.sale_type = 'sale'
)

SELECT 
    products.category_name,
    ROUND(SUM(loss_money)) AS total_loss_money
FROM
    inform
JOIN products USING (item_code)
GROUP BY
    products.category_name
ORDER BY total_loss_money DESC

/* Result / Результат
[
  {
    "category_name": "Aquatic Tuberous Vegetables",
    "total_loss_money": "2616684"
  },
  {
    "category_name": "Cabbage",
    "total_loss_money": "2887961"
  },
  {
    "category_name": "Capsicum",
    "total_loss_money": "4124354"
  },
  {
    "category_name": "Edible Mushroom",
    "total_loss_money": "4136195"
  },
  {
    "category_name": "Flower/Leaf Vegetables",
    "total_loss_money": "9387028"
  },
  {
    "category_name": "Solanum",
    "total_loss_money": "831592"
  }
]
*/







