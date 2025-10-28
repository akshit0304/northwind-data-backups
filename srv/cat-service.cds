using { bd.bModel.master as bd } from '../db/schema';


service CatalogService {
  entity Categories as projection on bd.Categories 
                    excluding {createdAt,createdBy,modifiedAt,modifiedBy};
}