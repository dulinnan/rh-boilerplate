const db = require('../../config/db'),
    crypto = require('crypto');

const getHash = function (password, salt) {
    return crypto.pbkdf2Sync(password, salt, 100000, 256, 'sha256').toString('hex');
};


/**
 * insert user
 */
const insert = function (user, done) {

    const salt = crypto.randomBytes(64);
    const hash = getHash(user.password, salt);

    //console.log(salt);

    let values = [[user.givenName, user.familyName, user.email, hash, salt.toString('hex')]];

    db.get_pool().query(
        'INSERT INTO admin_user (user_givenname, user_familyname, user_email, user_password, user_salt) VALUES (?)',
        values,
        function (err, results) {
            if (err) return done(err);
            return done(err, results.insertId)
        }
    );
};

/*
*   authenticate user
 */
const authenticate = function (email, password, done) {
    //console.log(username, email, password);
    db.get_pool().query(
        'SELECT user_id, user_password, user_salt FROM admin_user WHERE user_email=?',
        [email],
        function (err, results) {
            //
            // console.log(email, password);
            // console.log(results);

            if (err || results.length !== 1) {
                //console.log(err, results.length);
                return done(true); // return error = true (failed auth)
            } else {

                if (results[0].user_salt == null) {
                    results[0].user_salt = '';
                }

                let salt = Buffer.from(results[0].user_salt, 'hex');

                // console.log(salt);
                // console.log(results[0].user_id);
                // console.log(results[0].user_password);
                // console.log("Password: " + password);
                // console.log(getHash(password, salt));

                if (results[0].user_password === getHash(password, salt)) {
                    return done(false, results[0].user_id);
                } else {
                    console.log("failed password check");
                    return done(true); // failed password check
                }

            }
        }
    );
};

/**
 * get existing token
 *
 */
const getToken = function (id, done) {
    db.get_pool().query(
        'SELECT user_token FROM admin_user WHERE user_id=?',
        [id],
        function (err, results) {
            if (results.length === 1 && results[0].token)
                return done(null, results[0].token);
            return done(null, null);
        }
    );
};

/**
 * create and store a new token for a user
 */
const setToken = function (id, done) {
    let token = crypto.randomBytes(16).toString('hex');
    db.get_pool().query(
        'UPDATE admin_user SET user_token=? WHERE user_id=?',
        [token, id],
        function (err) {
            return done(err, token)
        }
    );
};


/**
 * remove a token for a user
 */
const removeToken = (token, done) => {
    db.get_pool().query(
        'UPDATE admin_user SET user_token=null WHERE user_token=?',
        [token],
        function (err) {
            return done(err)
        }
    )
};

/**
 * return user details, or null if user not found
 *
 * @param id
 * @param done
 */
const getOne = (id, done) => {

    let query = 'SELECT user_givenname AS givenName, user_familyname AS familyName, user_email AS email FROM admin_user WHERE user_id=?';
    db.get_pool().query(
        query,
        [id],
        function (err, users) {
            if (err)
                return done(err);
            return done(err, users.length > 0 ? users[0] : null);
        }
    )
};


/**
 * get the user id associated with a given token, return null if not found
 */
const getIdFromToken = function (token, done) {
    if (token === undefined || token === null)
        return done(true, null);
    else {
        db.get_pool().query(
            // 'SELECT user_id FROM admin_user WHERE user_token=?',
            'SELECT admin_user.user_id, permission_user.permission_id FROM admin_user JOIN permission_user ON admin_user.user_id=permission_user.user_id WHERE admin_user.user_token=?',
            [token],
            function (err, result) {
                if (result.length === 1)
                    return done(null, result[0]);
                return done(err, null);
            }
        )
    }
};

/**
 * update user
 *
 */
const alter = function (id, user, done) {

    let query_string = '';
    let values = [];

    if (user.hasOwnProperty('password')) {
        const salt = crypto.randomBytes(64);
        const hash = getHash(user.password, salt);

        query_string = 'UPDATE admin_user SET user_givenname=?, user_familyname=?, user_email=?, user_password=?, user_salt=? WHERE user_id=?';
        values = [user.givenName, user.familyName, user.email, hash, salt.toString('hex'), id];
    } else {
        query_string = 'UPDATE admin_user SET user_givenname=?, user_familyname=?, user_email=? WHERE user_id=?';
        values = [user.givenName, user.familyName, user.email, id];
    }

    //console.log(query_string, values);


    db.get_pool().query(query_string,
        values,
        function (err, results) {
            done(err);
        }
    );
};

module.exports = {
    insert: insert,
    authenticate: authenticate,
    getToken: getToken,
    setToken: setToken,
    removeToken: removeToken,
    getOne: getOne,
    getIdFromToken: getIdFromToken,
    alter: alter
};
