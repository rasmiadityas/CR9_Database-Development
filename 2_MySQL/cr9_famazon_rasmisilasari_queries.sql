/* cr9_famazon_rasmisilasari_queries */

/*1. Show all received shipments and their date from the earliest to the latest */

SELECT user.userName, orders.orderID, purchase.invoice, shipment.tracking, shipment.received 
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN purchase ON purchase.invoice = orders.invoice
INNER JOIN shipment ON shipment.tracking = orders.tracking
ORDER BY shipment.received ASC;

/*2. Show all orders paid with PayPal and their order date */

SELECT user.userName, orders.orderID, orders.created, purchase.invoice, payment.paymentName, payment.paymentInfo
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN purchase ON purchase.invoice = orders.invoice
INNER JOIN payment ON payment.paymentName = purchase.paymentName
WHERE purchase.paymentName = 'PayPal';

/*3. Show all products ordered by User #1 and their sum Price */

SELECT user.userName, orders.orderID, orders.created, item.title, orderitem.quantity, item.price*orderitem.quantity as 'sumPrice'
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN orderitem ON orderitem.orderID = orders.orderID
INNER JOIN item ON item.itemID = orderitem.itemID
WHERE user.userID = 1;

/*4. Show all orders and total price from city Vienna after 2005 */

SELECT user.userName, user.cityName, orders.orderID, orders.created, sum(orderitem.quantity*item.price) as 'totPrice'
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN orderitem ON orderitem.orderID = orders.orderID
INNER JOIN item ON item.itemID = orderitem.itemID
WHERE user.cityName = 'Vienna' AND EXTRACT(YEAR FROM orders.created) > 2005
GROUP BY orders.orderID;

/*5. Show all order created after 2009, the state, total amount and total price */

SELECT user.userName, orders.orderID, orders.created, city.state, sum(orderitem.quantity) as 'totAmount', sum(item.price*orderitem.quantity) as 'totPrice'
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN orderitem ON orderitem.orderID = orders.orderID
INNER JOIN item ON item.itemID = orderitem.itemID
INNER JOIN city ON city.cityName = user.cityName
WHERE EXTRACT(YEAR FROM orders.created) > 2009
GROUP BY user.userName;

/*6. Show all products sent to state Vienna, their amount and sum price */

SELECT user.userName, orders.orderID, orders.created, city.state, item.title, orderitem.quantity, item.price*orderitem.quantity as 'sumPrice'
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN orderitem ON orderitem.orderID = orders.orderID
INNER JOIN item ON item.itemID = orderitem.itemID
INNER JOIN city ON city.cityName = user.cityName
WHERE city.state = 'Vienna';

/*7 Show all ordered products from the earliest to the latest which shows: user name, order date, ordering state, courier, item, taste, company status and order amount   
* note: attempted bonus (use JOINS that connects 7 tables */

SELECT user.userName, orders.created, city.state, shipment.courierName, item.title, fruit.taste, company.status, orderitem.quantity
FROM user
INNER JOIN orders ON orders.userName = user.userName
INNER JOIN orderitem ON orderitem.orderID = orders.orderID
INNER JOIN item ON item.itemID = orderitem.itemID
INNER JOIN company ON company.companyName = item.companyName
INNER JOIN fruit ON fruit.fruitName = item.fruitName
INNER JOIN shipment ON shipment.tracking = orders.tracking
INNER JOIN city ON city.cityName = user.cityName
ORDER BY orders.created ASC;

