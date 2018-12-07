const
    log = require('./logger')(),
    config = require('../../config/config.js'),
    users = require('../models/user.server.models');

/**
 * authenticate based on token
 */
const isAuthenticated = function (req, res, next) {
    let token = req.get(config.get('authToken'));
    log.debug(`authenticating ${token}`);
    users.getIdFromToken(token, (err, result) => {
        if (err || result === null) {
            log.warn(`rejected auth attempt for token ${token}`);
            return res.sendStatus(401);
        } else if (result.permission_id != 1 || result.permission_id != 2) {
            log.warn(`Permission denied for token ${token}`);
            return res.sendStatus(401);
        }
        next();
    })
};

module.exports = {
    isAuthenticated: isAuthenticated
};
