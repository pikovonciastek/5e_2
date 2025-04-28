select ProductName, Categoryname, Price 
from products 
join categories on Products.CategoryID = Categories.CategoryID;


select ProductName, Categoryname, Price 
from products 
join categories on Products.CategoryID = Categories.CategoryID 
where price between 10 and 50;


