-- Question 1
SELECT 
    OrderID, 
    CustomerName, 
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM 
    ProductDetail 
JOIN 
    (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) n
    ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1;

-- Question 2
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
