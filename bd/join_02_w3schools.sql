-- 1. Wyświetl nazwy firm klientów  i daty zamówień
 select CustomerName, OrderDate 
 from orders 
 join customers 
 on orders.customerID = customers.CustomerID;

-- 2, Wyświetl dane spedytora z datą zamówienia
 select orderdate, shipperName
 from orders 
 join shippers 
 on shippers.shipperID = orders.ShipperID;

-- 3. Wyświetl nazwiska pracowników i daty zamówień
 select LastName, orderdate
 from orders
 join employees
 on orders.EmployeeID = employees.EmployeeID;

-- 4. Wyświetl nazwy towarów, nazwy kategorii
 select productname, categoryName
 from products
 join categories
 on products.categoryID = categories.categoryID;

-- 5. Wyświetl nazwy towarów, nazwy kategorii i idzamówień
 select productname, categoryname, orderid
 from products 
join categories
 on products.categoryID = categories.categoryID
join order_details
 on products.productID = order_details.productid;

-- 6. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i idklienta
 select productname, categoryname, orderdate, CustomersID
 from products
 join order_details
 on products.productID = order_details.productid
 join orders
 on order_details.orderid = orders.orderid;

-- 7. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i nazwę firmy klienta
 

-- 8. Ile razy był zamawiany dany produkt? (podaj nazwy produktów)
 select productName, quantity from products 
 join order_details
 on products.productID = order_details.productid
 group by productname;

-- 9. Wyświetl nazwy firm klientów, daty zamówień i nazwy towarów
select productname, orderdate, CustomerName from products
join order_details
on products.productID = order_details.productid
join customers
on order_details.CustomerID