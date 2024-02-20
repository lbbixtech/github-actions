WITH internet_sales AS (
	SELECT 
	fis.product_key,
	fis.order_date_key,
	fis.due_date_key,
	fis.customer_key,
	fis.promotion_key,
	fis.currency_key,
	fis.sales_territory_key,
	fis.order_quantity,
	CAST(fis.product_standard_cost AS numeric),
	CAST(fis.total_product_cost AS numeric),
	CAST(fis.order_quantity AS numeric) * CAST(fis.product_standard_cost AS numeric) AS total_price
	FROM fact_internet_sales fis  
)
SELECT 
	count(*)
FROM internet_sales
WHERE total_product_cost <> total_price;