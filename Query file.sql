USE ecommerce_project;
CREATE TABLE ecommerce_data (
    Product_ID VARCHAR(255),
    Product_Name VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Tax_Rate DECIMAL(5,2),
    Stock_level INT,
    Supplier_ID VARCHAR (255),
    Customer_Age_Group VARCHAR(50),
    Customer_Location VARCHAR(100),
    Customer_Gender VARCHAR(10),
    Shipping_Cost DeCIMAL(5,2),
    Shipping_Method VARCHAR(255),
    Return_Rate DECIMAL(5,2),
    Seasonality VARCHAR(50),
    Popularity_Index INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/diversified_ecommerce_dataset.csv'
INTO TABLE ecommerce_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM ecommerce_data LIMIT 10;

SELECT COUNT(*) AS total_rows FROM ecommerce_data;
SELECT * FROM ecommerce_data LIMIT 10;

#NoofUniqueProducts
SELECT 
COUNT(DISTINCT Product_Name) AS unique_products,
COUNT(DISTINCT Category) AS categories,
COUNT(DISTINCT Customer_Location) AS locations
FROM ecommerce_data;

#Revenuebycategory
SELECT 
Category,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue
FROM ecommerce_data
GROUP BY Category
ORDER BY revenue DESC;

#Customersegmentrevenue
SELECT 
Customer_Age_Group,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue
FROM ecommerce_data
GROUP BY Customer_Age_Group
ORDER BY revenue DESC;

#Highreturnriskcategories
SELECT 
Category,
ROUND(AVG(Return_Rate),2) AS avg_return_rate
FROM ecommerce_data
GROUP BY Category
ORDER BY avg_return_rate DESC;

#Profitabilityview
SELECT 
Category,
ROUND(SUM(
(Price * (1 - Discount/100))
- Shipping_Cost
- (Price * Tax_Rate/100)
),2) AS net_profit
FROM ecommerce_data
GROUP BY Category
ORDER BY net_profit DESC;

#Profitabilityofcategories
SELECT 
Category,
ROUND(SUM(
(Price * (1 - Discount/100))
- Shipping_Cost
- (Price * Tax_Rate/100)
),2) AS net_profit
FROM ecommerce_data
GROUP BY Category
ORDER BY net_profit DESC;

#ReturnriskforBooks
SELECT 
Category,
ROUND(AVG(Return_Rate),2) AS avg_return_rate
FROM ecommerce_data
GROUP BY Category
ORDER BY avg_return_rate DESC;

#WhoisbuyingBooks?
SELECT 
Customer_Age_Group,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue
FROM ecommerce_data
WHERE Category = 'Books'
GROUP BY Customer_Age_Group
ORDER BY revenue DESC;

#Discountdependency
SELECT 
Category,
ROUND(AVG(Discount),2) AS avg_discount
FROM ecommerce_data
GROUP BY Category
ORDER BY avg_discount DESC;

#hiddenrevenueleaks
SELECT 
Product_Name,
Category,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue,
ROUND(AVG(Return_Rate),2) AS return_rate
FROM ecommerce_data
GROUP BY Product_Name, Category
HAVING return_rate > 10
ORDER BY revenue DESC
LIMIT 10;

#LocationIntelligence
SELECT 
Customer_Location,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue,
ROUND(AVG(Return_Rate),2) AS return_rate
FROM ecommerce_data
GROUP BY Customer_Location
ORDER BY revenue DESC
LIMIT 10;

#OperationsIntelligence
SELECT 
Shipping_Method,
ROUND(AVG(Shipping_Cost),2) AS avg_shipping_cost,
ROUND(AVG(Return_Rate),2) AS avg_return_rate,
ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue
FROM ecommerce_data
GROUP BY Shipping_Method
ORDER BY revenue DESC;

#Contribution
WITH category_revenue AS (
    SELECT 
        Category,
        SUM(Price * (1 - Discount/100)) AS revenue
    FROM ecommerce_data
    GROUP BY Category
)

SELECT 
    Category,
    ROUND(revenue,2) AS revenue,
    ROUND(100 * revenue / SUM(revenue) OVER (),2) AS revenue_contribution_pct
FROM category_revenue
ORDER BY revenue DESC;

#RankHigh-RiskProducts
SELECT 
    Product_Name,
    Category,
    ROUND(AVG(Return_Rate),2) AS return_rate,
    RANK() OVER (ORDER BY AVG(Return_Rate) DESC) AS risk_rank
FROM ecommerce_data
GROUP BY Product_Name, Category;

#DiscountSensitivity
SELECT 
    Category,
    CASE 
        WHEN Discount > 30 THEN 'High Discount'
        WHEN Discount BETWEEN 10 AND 30 THEN 'Medium Discount'
        ELSE 'Low Discount'
    END AS discount_bucket,
    ROUND(SUM(Price * (1 - Discount/100)),2) AS revenue
FROM ecommerce_data
GROUP BY Category, discount_bucket;