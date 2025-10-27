namespace bd.businessSol;


using { cuid ,managed } from '@sap/cds/common';

entity Category:cuid {
      CategoryName : String(100);
      Description  : String;          // long text
}

entity Supplier :cuid{
      CompanyName  : String(100);
      ContactName  : String(100);
      ContactTitle : String(100);
      Address      : String(200);
      City         : String(100);
      PostalCode   : String(20);
      Country      : String(100);
      Phone        : String(50);
      Fax          : String(50);
}


entity Product:cuid {
      ProductName    : String(200);
      supplier           : String null;   // FK -> Suppliers.SupplierID
      category           : String null; // FK -> Categories.CategoryID
      QuantityPerUnit: String(100);
      UnitPrice      : Decimal(15,2);
      UnitsInStock   : Integer;
      UnitsOnOrder   : Integer;
      ReorderLevel    : Integer;
      Discontinued   : Boolean;
}


entity Shipper :cuid{
      CompanyName: String(100);
      Phone      : String(50);
}


entity Customer:cuid {
      CompanyName: String(100);
      ContactName: String(100);
      ContactTitle: String(100);
      Address    : String(200);
      City       : String(100);
      PostalCode : String(20);
      Country    : String(100);
      Phone      : String(50);
      Fax        : String(50);
}

entity Employee :cuid{
  // key EmployeeID  : Integer;
      LastName    : String(100);
      FirstName   : String(100);
      Title       : String(100);
      TitleOfCourtesy : String(50);
      BirthDate   : DateTime;
      HireDate    : DateTime;
      Address     : String(200);
      City        : String(100);
      PostalCode  : String(20);
      Country     : String(100);
      HomePhone   : String(50);
      Extension   : String(20);
      reportsTo        : String  // self-association
}


entity Order:cuid {
  // key OrderID    : Integer;
      Customer   : String;   // FK -> Customers.CustomerID
      Employee   : String;   // FK -> Employees.EmployeeID
      OrderDate  : DateTime;
      RequiredDate : DateTime;
      ShippedDate  : DateTime;
      ShipVia      : String;   // FK -> Shippers.ShipperID
      Freight      : Decimal(15,2);
      ShipName     : String(200);
      ShipAddress  : String(200);
      ShipCity     : String(100);
      ShipPostalCode : String(20);
      ShipCountry  : String(100);
}


entity OrderDetail:cuid {
      Order       : Integer;    // part of composite PK
      Product     : Integer;  // part of composite PK
      UnitPrice   : Decimal(15,2);
      Quantity    : Integer;
      Discount    : Decimal(5,2);            // stored as fraction or percent per your convention
}