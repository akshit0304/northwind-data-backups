/* module.exports =function Catalog() {
    // this.on('test',(function(){console.log(this)}),
    this.on('try_fun',({data:{input1,input2}})=>input1+input2)
    // this.on("test",({})=>"hello my name is akshit")
} */

// const { count } = require("console");

// const SELECT = require("@sap/cds/lib/ql/SELECT");

// const cdsLog = require("@sap/cds/lib/log/cds-log");
// const LOG =cds.log('sql');
const LOG = require('../logger/logger');
const log = LOG;
module.exports = function Catalog() {
    const entity_ = this.entities;
    this.on(
        "sum", function ({ data: { x, y } }) {
            log.debug("sum executed");
            // console.log(entity);
            return x + y;
        }
    );
    this.on("count", async function (req) {
        let entity = req.data.tbl;
        console.log("data")
        // console.log(entity in Object.keys(entity_))
        if (entity in entity_) {
            // console.log(await SELECT.from(entity).columns("ID"));
            const result = await SELECT.one.from(entity).columns`count(*) as total`;
            // Return the count value
            return result.total;

        }
        return null;
        // return "hello"
    });

    this.before(
        "CREATE", "*", function (x) {
            console.log(x);
            if (typeof rating == "string") {
                const map = {
                    "low": 1,
                    "medium": 3,
                    "high": 5
                };
                return map[rating] ? map['rating'] : -1
            }
            return rating
        }
    )

}


/* const cds = require('@sap/cds');
module.exports =class Catalog extends cds.Service {
    sum(x,y){
        return x+y;
    }
    
    count(){
        return "not implemented"
    }
}
 */