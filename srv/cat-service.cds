using bd.businessSol as my from '../db/schema';


service CatalogService {
    
    // @readonly entity Books as projection on my.Books;
    entity Category as projection on my.Category;
    entity Product as projection on my.Product;
    entity Supplier as projection on my.Supplier;
}
