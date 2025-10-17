namespace bd.extra;

using { cuid,managed } from '@sap/cds/common';

entity Author: cuid,managed{
    name:String(50) not null;
    address:String;
    books: Composition of many Book on books.author=$self; 
}


entity Book : cuid,managed {
        name:String not null;
        author :Association to Author;
        @mandatory
        rating :Integer @assert.range enum {
            low=1;medium=3;high=5;![null]=-1
        } 

}
// annotation
annotate Author with { modifiedAt @odata.etag }