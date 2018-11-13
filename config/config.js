const convict = require('convict');

let config = convict({
    port: {
        format: 'port',
        default: 4941,
        arg: 'port',
    },
    basepath: {
        format: String,
        default: '/api/',
        arg: 'basepath',
    },
    authToken: {
        format: String,
        default: 'X-Authorization'
    },
    db: {
        host: { // host, rather than hostname, as mysql connection string uses 'host'
            format: String,
            default: "rh-holidays-db.cvaigtzmlayy.ap-northeast-1.rds.amazonaws.com"
        },
        user: {
            format: String,
            default: 'ruralholidays'
        },
        password: {
            format: String,
            default: 'rh-holidays-admin'
        },
        database: {
            format: String,
            default: 'rh'
        },
        port: {
            format: 'port',
            default: 3306,
            arg: 'mysql-port',
        },
        multipleStatements: {
            format: Boolean,
            default: true
        }
    }
});


module.exports = config;
