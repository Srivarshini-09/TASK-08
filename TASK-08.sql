USE ECommerceDB;

DELIMITER //
CREATE PROCEDURE 
GetCustomerOrders (IN customer_id
INT)
BEGIN
SELECT OrderID, TotalAmount
FROM orders
WHERE CustomerID = customer_id ;
END //
DELIMITER ; 

DELIMITER //
CREATE FUNCTION
CalculateDiscount(amount
DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE discount DECIMAL(10,2);
IF amount > 5000 THEN
SET discount = amount * 0.10;
ELSE 
SET discount = amount * 0.05;
END IF;
RETURN discount;
END //
DELIMITER ;

CALL GetCustomerOrders(3);

SELECT OrderID, TotalAmount,
CalculateDiscount(TotalAmount) AS
DISCOUNT
FROM orders;