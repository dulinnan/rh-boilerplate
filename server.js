const db = require('./config/db'),
    express = require('./config/express');
// ssh -i /Users/linnandu/Documents/Dev/RH.pem -l ec2-user 52.192.140.53
const app = express();

db.connect(function (err) {
    if (err) {
        console.log('Unable to connect to MySQL');
        process.exit(1);
    } else {
        app.listen(4941, function () {
            console.log('Listening on port: 4941');
        });
    }
});

