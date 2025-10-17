const { format } = require('@sap/cds/lib/utils/cds-utils');
const winston = require('winston');

const logger =winston.createLogger({
    level:'debug',
    format:winston.format.json(),
    defaultMeta: { service: 'user-service' },
    transports:[
        new winston.transports.Console({
            format: winston.format.simple(),
            // format.colorize(),
        }),
            new winston.transports.File({ filename: './logger/debug.log', level: 'debug'}),
            new winston.transports.File({ filename: './logger/debug_simple.log', level: 'debug',format: winston.format.combine(
                            elegant_new_format())
                        }),

            new winston.transports.File({ filename: './error.log', level: 'error' }),


    ]


})

module.exports =logger;



// logger format
function elegant_new_format(){
    return winston.format.printf(({level,message})=>{
       return `${message}\n` 
    })
}
