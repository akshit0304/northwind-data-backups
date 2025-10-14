namespace bd.businessSol;

using {
  cuid,
  managed
} from '@sap/cds/common';


// context master {

// }

// context transactional {

// }

// entity Books {
//   key ID    : Integer;
//       title : String;
//       stock : Integer;
// }

entity Category : cuid {
  Name        : String(50);
  Description : String(150);

}

entity Product : cuid {
  Name            : String(50);
  CategoryID      : Association to Category;
  SupplierID      : Association to Supplier;
  QuantityPerUnit : String(30);
  UnitPrice       : Integer;
  UnitsInStock    : Integer;
  UnitsOnOrder    : Integer;
  ReorderLevel    : Integer;
  Discontinued    : Boolean;

}


entity Supplier : cuid {
  CompanyName  : String(50);
  ContactName  : String(50);
  ContactTitle : String(35);
  Address      : String(100);
  City         : String;
  PostalCode   : Int32;
  Country      : String;
  Region       : String;
  Phone        : String; //need to add country code
  Fax          : String;
  HomePage     : String;

}
