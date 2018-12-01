const db = require('../../config/db');
const fs = require('fs');
const User = require('./user.server.models');

exports.database_reset = function (done) {
    let script = fs.readFileSync('./app/scripts/reset.sql', 'utf8');

    db.get_pool().query(script, function (err, rows) {
        //console.log(err, rows);
        if (err) {
            return done(err);
        }
        done(false);
    });
}

exports.database_resample = function (done) {

    // ('', 'T', '', 'black.panther@super.heroes', 'Wakanda', '0.00' , '500'),
    let user1 = {
        "givenName": "admin",
        "familyName": "super",
        "email": "root@local.host",
        "password": "admin"
    };

    // ('superman', 'Clark', 'Kent', 'superman@super.heroes', 'kryptonite', '0.00', '900'),
    let user2 = {
        "givenName": "Clark",
        "familyName": "Kent",
        "email": "superman@super.heroes",
        "password": "kryptonite"
    };


    User.insert(user1, function () {
        User.insert(user2, function () {

            let script = fs.readFileSync('./app/scripts/resample.sql', 'utf8');

            db.get_pool().query(script, function (err, rows) {
                // console.log(err, rows);
                if (err) return done(err);
                done(false);
            });
        });
    });
}

