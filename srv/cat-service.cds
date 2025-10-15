using bd.businessSol as my from '../db/schema';


service CatalogService {
  entity Category as projection on my.Category;
  entity Product   as projection on my.Product;
  entity Supplier  as projection on my.Supplier;
  entity Customer  as projection on my.Customer;
  entity Employee  as projection on my.Employee;
  entity Shipper   as projection on my.Shipper;
  entity Order     as projection on my.Order;
  entity OrderDetail as projection on my.OrderDetail;
}
