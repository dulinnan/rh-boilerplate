const db = require('./config/db'),
    express = require('./config/express');
// ssh -i /Users/linnandu/Documents/Dev/RH.pem -l ec2-user 52.192.140.53
const app = express();
const
    config = require('./config/config.js'),
    port = config.get('port'),
    basepath = config.get('basepath');

db.connect(function (err) {
    if (err) {
        console.log('Unable to connect to MySQL');
        process.exit(1);
    } else {
        app.listen(port, function () {
            console.log('listening on localhost:' + port + basepath);
        });
    }
});

