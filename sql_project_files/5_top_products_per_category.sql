/*Какие 3 товара в каждой категории дают наибольшую суммарную выручку 
	за весь период?*/

/*Which 3 products in each category generate the highest total revenue 
    over the entire period?*/



WITH inform AS (
    SELECT 
        category_name AS category,
        item_name AS product,
        ROUND(SUM(quantity_kg * unit_price), 2) AS revenue,
        ROW_NUMBER() OVER(PARTITION BY category_name 
                          ORDER BY SUM(quantity_kg * unit_price) DESC) as idd
    FROM
        products
    JOIN sales USING (item_code)
    WHERE 
        sale_type = 'sale'
    GROUP BY 
        category_name,
        item_code
)

SELECT
    category,
    product,
    revenue
FROM inform
WHERE 
    idd <= 3
ORDER BY 
    category,
    revenue DESC



/*
[
  {
    "category": "Aquatic Tuberous Vegetables",
    "product": "Net Lotus Root (1)",
    "revenue": "211769.93970"
  },
  {
    "category": "Aquatic Tuberous Vegetables",
    "product": "Honghu Lotus Root Powder (Fenou)",
    "revenue": "64410.00000"
  },
  {
    "category": "Aquatic Tuberous Vegetables",
    "product": "Honghu Lotus Root",
    "revenue": "21463.04420"
  },
  {
    "category": "Cabbage",
    "product": "Broccoli",
    "revenue": "270060.55560"
  },
  {
    "category": "Cabbage",
    "product": "Qinggengsanhua",
    "revenue": "58277.91580"
  },
  {
    "category": "Cabbage",
    "product": "Zhijiang Qinggengsanhua",
    "revenue": "47453.09590"
  },
  {
    "category": "Capsicum",
    "product": "Wuhu Green Pepper (1)",
    "revenue": "205219.93850"
  },
  {
    "category": "Capsicum",
    "product": "Paopaojiao (Jingpin)",
    "revenue": "95610.68490"
  },
  {
    "category": "Capsicum",
    "product": "Luosi Pepper",
    "revenue": "82031.93210"
  },
  {
    "category": "Edible Mushroom",
    "product": "Xixia Mushroom (1)",
    "revenue": "211356.71980"
  },
  {
    "category": "Edible Mushroom",
    "product": "Xixia Black Mushroom (1)",
    "revenue": "60182.66450"
  },
  {
    "category": "Edible Mushroom",
    "product": "Needle Mushroom (Box)",
    "revenue": "58669.50000"
  },
  {
    "category": "Flower/Leaf Vegetables",
    "product": "Yunnan Shengcai",
    "revenue": "129797.06750"
  },
  {
    "category": "Flower/Leaf Vegetables",
    "product": "Yunnan Lettuces",
    "revenue": "70692.25110"
  },
  {
    "category": "Flower/Leaf Vegetables",
    "product": "Yunnan Lettuce (Bag)",
    "revenue": "64041.50000"
  },
  {
    "category": "Solanum",
    "product": "Eggplant (2)",
    "revenue": "117797.52970"
  },
  {
    "category": "Solanum",
    "product": "Changxianqie",
    "revenue": "26313.11340"
  },
  {
    "category": "Solanum",
    "product": "Green Eggplant (1)",
    "revenue": "23370.19110"
  }
]
*/