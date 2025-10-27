namespace bd.bModel;

using {
    cuid,
    managed
} from '@sap/cds/common';

// =======================================
// define type
type ItemName : String(100);
// =======================================

entity Categories : cuid, managed {
    CategoryName : ItemName not null;
    Description  : String;
    products     : Association to many Products
                       on products.category = $self;
}

entity Products : cuid, managed {
    ProductName     : ItemName not null;
    orders          : Association to many OrderDetails
                          on orders.product = $self; //need to rectify
    supplier        : Association to Suppliers; // FK -> Suppliers.SupplierID
    category        : Association to Categories; // FK -> Categories.CategoryID
    QuantityPerUnit : String(100);
    UnitPrice       : Decimal(15, 2);
    UnitsInStock    : Integer;
    UnitsOnOrder    : Integer;
    ReorderLevel    : Integer;
    Discontinued    : Boolean;
}

entity Suppliers : cuid, managed {
    products         : Association to many Products
                           on products.supplier = $self;
    CompanyName      : String(100) not null;
    ContactName      : type of CompanyName not null;
    ContactTitle     : type of CompanyName;
    ContactTitleName : type of CompanyName = ContactTitle || ' ' || ContactName;
    Address          : String(250);
    City             : type of CompanyName;
    PostalCode       : String(20);
    Country          : type of CompanyName;
    Phone            : String(50); // need to validation of mobile number (set using event handlers)
    Fax              : String(50);
    Website          : type of CompanyName default 'www.notexist.com'
}

entity Customers : cuid, managed {
    orders           : Association to many Orders
                           on orders.customer = $self;
    CompanyName      : Suppliers:CompanyName not null;
    ContactName      : type of CompanyName;
    ContactTitle     : type of CompanyName;
    ContactTitleName : type of CompanyName = ContactTitle || ' ' || ContactName;
    Address          : Suppliers:Address;
    City             : type of CompanyName;
    Country          : type of CompanyName;
    PostalCode       : String(20);
    Phone            : String(20);
    Fax              : String(50);
}

entity Orders : cuid, managed {
    orderIDs       : Composition of many OrderDetails
                         on orderIDs.order = $self; //how to set product id
    customer       : Association to Customers; // FK -> Customers.CustomerID
    employee       : Association to Employees; // FK -> Employees.EmployeeID
    ShipVia        : Association to Shippers; // FK -> Shippers.ShipperID
    // product        : Association to Products;
    OrderDate      : DateTime not null;
    RequiredDate   : DateTime;
    ShippedDate    : DateTime;
    Freight        : Decimal(15, 2);
    ShipName       : String(200);
    ShipAddress    : String(200);
    ShipCity       : String(100);
    ShipPostalCode : String(20);
    ShipCountry    : String(100);
}

entity OrderDetails : managed {
    order     : Association to Orders;
    product   : Association to Products;
    UnitPrice : Decimal(15, 2);
    Quantity  : Integer;
    Discount  : Decimal(5, 2);
}


entity Regions : cuid {
    territories : Association to many Territories
                      on territories.region = $self;
    Description : String(200) not null;

}

entity Territories : cuid {
    region      : Association to Regions;
    Description : String(200) not null;
    employee    : Association to one Employees

}

entity Employees : cuid, managed {
    reportsTo       : Association to Employees;
    territory       : Association to one Territories;
    orders          : Association to many Orders
                          on orders.employee = $self;
    LastName        : Suppliers:ContactName;
    FirstName       : type of LastName;
    Title           : type of LastName;
    TitleOfCourtesy : String(50);
    BirthDate       : DateTime not null;
    HireDate        : DateTime not null;
    Address         : String(200);
    City            : type of LastName;
    PostalCode      : String(20);
    Country         : type of LastName;
    HomePhone       : String(50);
    Extension       : String(20);
    Notes           : String;
}

entity Shippers : cuid, managed {
    orders      : Association to many Orders
                      on orders.ShipVia = $self;
    CompanyName : Suppliers : CompanyName;
    Phone       : String(20) default '9099973246'
}
