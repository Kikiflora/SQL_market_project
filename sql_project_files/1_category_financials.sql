--Какова выручка, себестоимость, прибыль и маржинальность (%) по категориям товаров?

--What are the revenue, cost of goods sold, profit, and profit margins (%) by product category?


WITH inform AS ( --Данные для вычислений / Data for calculating
    SELECT
        p.category_name AS category_name,
        s.quantity_kg AS quantity_kg,
        s.unit_price AS unit_price,
        pr.wholesale_price AS wholesale_price
    FROM 
        products p
    JOIN sales s USING (item_code)
    JOIN prices pr ON  pr.item_code = s.item_code 
        AND s.sale_date = pr.price_date
    WHERE
        sale_type = 'sale'
)
SELECT
    category_name,
    ROUND(SUM(quantity_kg * unit_price), 2) AS revenue, --Выручка
    ROUND(SUM(quantity_kg * wholesale_price), 2) AS cost_price, --Себестоимость
    ROUND(SUM(quantity_kg * unit_price) - SUM(quantity_kg * wholesale_price), 2) 
        AS profit, --Прибыль
    ROUND(((SUM(quantity_kg * unit_price) - SUM(quantity_kg * wholesale_price)) /
        SUM(quantity_kg * unit_price)) * 100, 2) AS margin --Маржа
FROM
    inform
GROUP BY
    category_name
ORDER BY
    revenue DESC


/* Result / Результат
[
  {
    "category_name": "Flower/Leaf Vegetables",
    "revenue": "1079834.83",
    "cost_price": "649284.92",
    "profit": "430549.91",
    "margin": "39.87"
  },
  {
    "category_name": "Capsicum",
    "revenue": "754564.42",
    "cost_price": "474862.25",
    "profit": "279702.17",
    "margin": "37.07"
  },
  {
    "category_name": "Edible Mushroom",
    "revenue": "620110.20",
    "cost_price": "394106.95",
    "profit": "226003.26",
    "margin": "36.45"
  },
  {
    "category_name": "Cabbage",
    "revenue": "375980.84",
    "cost_price": "245004.54",
    "profit": "130976.31",
    "margin": "34.84"
  },
  {
    "category_name": "Aquatic Tuberous Vegetables",
    "revenue": "350306.06",
    "cost_price": "242381.85",
    "profit": "107924.21",
    "margin": "30.81"
  },
  {
    "category_name": "Solanum",
    "revenue": "191226.98",
    "cost_price": "121809.80",
    "profit": "69417.18",
    "margin": "36.30"
  }
]
*/