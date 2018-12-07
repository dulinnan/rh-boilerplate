const listings = require('../models/listing.server.models'),
    users = require('../models/user.server.models'),
    log = require('../lib/logger')(),
    validator = require('../lib/validator'),
    config = require('../../config/config.js'),
    schema = require('../../config/Rural-Holidays_API_schemas.json'),
    fs = require('fs'),
    path = require('path'),
    app_dir = path.dirname(require.main.filename);


/**
 * list all listings
 */
exports.list = function (req, res) {
    console.log("get all listings...");
    validator.areValidParameters(req.query, schema.paths['/listings'].get.parameters)
        .then(function () {
            listings.getAll(req.query, function (err, results) {

                if (err || !results) {
                    // console.log("err", err);
                    // console.log("results", results);
                    return res.sendStatus(400);
                }
                if (results.length == 0) {
                    // console.log("empty");
                    return res.status(200).json(results);
                } else {
                    if (!validator.isValidSchema(results, 'components.schemas.listingsOverview')) {
                        log.warn(JSON.stringify(results, null, 2));
                        log.warn(validator.getLastErrors());
                        return res.sendStatus(500);
                    } else {
                        return res.status(200).json(results);
                    }
                }
            })
        })
        .catch(function (err) {
            // console.log(err);
            res.sendStatus(400)
        })
}

/**
 * create a new listing, from a request body that follows the `Listings` schema definition
 *
 * (must be authenticated)
 */
exports.create = function (req, res) {
    console.log(JSON.stringify(req.body));
    if (!validator.isValidSchema(req.body, 'components.schemas.PostListing')) {
        log.warn(`listings.controller.create: bad listing against schema ${JSON.stringify(req.body)}`);
        return res.sendStatus(400);
    } else {
        let listing = Object.assign({}, req.body);

        if (!listing["endDateTime"] || listing["endDateTime"] <= 0) {
            log.warn(`listings.controller.create: bad end date ${JSON.stringify(listing)}`);
            return res.sendStatus(400);
        }

        let date_time_now = (new Date).getTime();
        if (!listing["startDateTime"] || listing["startDateTime"] <= 0 || listing["startDateTime"] <= date_time_now) {
            log.warn(`listings.controller.create: bad start date ${JSON.stringify(listing)}`);
            return res.sendStatus(400);
        }

        if (listing["startDateTime"] >= listing["endDateTime"]) {
            log.warn(`listings.controller.create: start date must be before end ${JSON.stringify(listing)}`);
            return res.sendStatus(400);
        }

        let token = req.get(config.get('authToken'));

        users.getIdFromToken(token, function (err, user_id) {
            if (err) {
                log.warn(`listings.controller.create: couldn't get id from token: ${err}`);
                return res.sendStatus(400);
            }

            listings.insert(listing, user_id, function (err, id) {
                if (err) {
                    log.warn(`listings.controller.create: couldn't create ${JSON.stringify(listing)}: ${err}`);
                    return res.sendStatus(400); // duplicate record
                }
                log.warn(`listings.controller.create: created successfully ${JSON.stringify(listing)}`);
                res.status(201).json({id: id});
            });

        });
    }
}

/**
 * Get all bids for a given listing
 */
exports.get_bids = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    listings.getBids(listing_id, function (err, results) {
        if (err) {
            log.warn(`listings.controller.get_bids: model returned error: ${err}`);
            return res.sendStatus(500);
        }

        res.status(200).json(results);
    });
}

/**
 * Add a bid for a listing
 *
 * (must be authenticated)
 */
exports.add_bid = function (req, res) {
    let date_time_now = (new Date).getTime();


    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    let amount = parseInt(req.query.amount);
    if (!validator.isValidId(amount)) return res.sendStatus(400);


    listings.getOne(listing_id, function (err, results) {
        if (err) return res.sendStatus(404);

        if (!results || results.length != 1) return res.sendStatus(400);

        let result = results[0];

        let end_date_time = Date.parse(result['listing_endingdate']);
        let start_date_time = Date.parse(result['listing_startingdate']);

        let starting_amount = result['listing_startingprice'];

        console.log("*************");
        console.log("end_date", result['listing_endingdate'], end_date_time);
        console.log("now", date_time_now);
        let iso_time = new Date().toISOString();
        console.log("iso_time", iso_time, Date.parse(iso_time));
        console.log("*************");

        if (start_date_time >= date_time_now) {
            log.warn(`listings.controller.add_bids: adding bid before start date: ${result['listing_startingdate']}`);
            return res.sendStatus(400);
        } else if (end_date_time <= date_time_now) {
            log.warn(`listings.controller.add_bids: adding bid after end date: ${result['listing_endingdate']}`);
            return res.sendStatus(400);
        } else {
            listings.getBids(listing_id, function (err, current_bids) {
                if (err) {
                    log.warn(`listings.controller.get_bids: model returned error: ${err}`);
                    return res.sendStatus(500);
                }

                let max_bid = 0;
                if (current_bids && current_bids.length > 0) {

                    max_bid = current_bids[0]['amount'];

                    for (let item of current_bids) {
                        if (item['amount'] > max_bid) {
                            max_bid = item['amount'];
                        }
                    }
                }

                if (amount <= max_bid || amount <= starting_amount) {
                    log.warn(`listings.controller.add_bids: bid is less than or equal to current amount`);
                    res.sendStatus(400);
                } else {
                    let token = req.get(config.get('authToken'));

                    users.getIdFromToken(token, function (err, user_id) {
                        if (err) {
                            log.warn(`listings.controller.add_bid: couldn't get id from token: ${err}`);
                            return res.sendStatus(400);
                        }

                        listings.addBid(listing_id, user_id, amount, function (err, results) {
                            if (err) {
                                log.warn(`listings.controller.get_bids: model returned error: ${err}`);
                                return res.sendStatus(500);
                            }

                            res.sendStatus(201);
                        });
                    });
                }


            });
        }
    });
}


/**
 * Get a single listing
 */
exports.get_one = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);


    listings.getOne(listing_id, function (err, results) {
        if (err) {
            log.warn(`listings.controller.get_one: model returned err: ${err}`);
            return res.sendStatus(500);
        } else if (!results) {
            return res.sendStatus(404);
        } else {

            //console.log(results);
            let result = results[0];

            let temp_result = {
                "categoryId": result['listing_categoryid'],
                "categoryTitle": result['category_title'],
                "title": result['listing_title'],
                "reservePrice": result['listing_reserveprice'],
                "startDateTime": Date.parse(result['listing_startingdate']),
                "endDateTime": Date.parse(result['listing_endingdate']),
                "description": result['listing_description'],
                "creationDateTime": Date.parse(result['listing_creationdate']),
                "seller": {
                    "id": result['listing_userid'],
                    "username": result['user_username']
                },
                "startingBid": result['listing_startingprice']
            };

            //console.log(temp_result);

            listings.getBids(listing_id, function (err, current_bids) {
                if (err) {
                    log.warn(`listings.controller.get_bids: model returned error: ${err}`);
                    return res.sendStatus(500);
                } else {
                    if (current_bids && current_bids.length > 0) {
                        let max_bid = current_bids[0]['amount'];
                        let bids = []

                        for (let item of current_bids) {

                            bids.push({
                                "amount": item['amount'],
                                "datetime": item['datetime'],
                                "buyerId": item['buyerId'],
                                "buyerUsername": item['buyerUsername']
                            });


                            if (item['amount'] > max_bid) {
                                max_bid = item['amount'];
                            }
                        }

                        temp_result['currentBid'] = max_bid;
                        temp_result['bids'] = bids;
                    } else {
                        temp_result['currentBid'] = 0;
                        temp_result['bids'] = [];
                    }

                    return res.status(200).send(temp_result);
                }
            });
        }
    });
}


/**
 * Update a listing
 */
exports.update = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    let token = req.get(config.get('authToken'));
    console.log('Update listing=', token);
    users.getIdFromToken(token, function (err, _id) {

        if (!validator.isValidSchema(req.body, 'components.schemas.Listings')) {
            log.warn(`users.controller.update: bad listing ${JSON.stringify(req.body)}`);
            return res.sendStatus(400);
        }

        listings.getOne(listing_id, function (err, results) {
            if (err) {
                log.warn(`listings.controller.update: model returned err: ${err}`);
                return res.sendStatus(500);
            } else if (!results) {
                return res.sendStatus(404);
            } else {

                let result = results[0];

                let user_id = results[0]['listing_userid'];

                if (_id !== user_id) {
                    console.log('user_id=', user_id, ' and user_id=', _id);
                    return res.sendStatus(401);
                }

                //get time now and start time
                let time_now = Date.now();
                let listing_start_time = Date.parse(result['listing_startingdate']);

                if (listing_start_time < time_now) {
                    res.status(403);
                    //res.statusText('Forbidden - bidding has begun on the listing.');
                    res.send();
                } else {
                    //do the update
                    let category_id = 0;
                    let title = "";
                    let reserve_price = 0;
                    let start_date_time = 0;
                    let end_date_time = 0;
                    let description = ""
                    let starting_bid = 0;

                    if (req.body.hasOwnProperty('categoryId')) {
                        category_id = req.body['categoryId'];
                    } else {
                        category_id = result['listing_categoryid'];
                    }

                    if (req.body.hasOwnProperty('title')) {
                        title = req.body['title'];
                    } else {
                        title = result['listing_title'];
                    }

                    if (req.body.hasOwnProperty('reservePrice')) {
                        reserve_price = req.body['reservePrice'];
                    } else {
                        reserve_price = result['listing_reserveprice'];
                    }

                    if (req.body.hasOwnProperty('startDateTime')) {
                        start_date_time = req.body['startDateTime'];
                    } else {
                        start_date_time = Date.parse(result['listing_startingdate']);
                    }

                    if (req.body.hasOwnProperty('endDateTime')) {
                        end_date_time = req.body['endDateTime'];
                    } else {
                        end_date_time = Date.parse(result['listing_endingdate']);
                    }

                    if (req.body.hasOwnProperty('description')) {
                        description = req.body['description'];
                    } else {
                        description = result['listing_description'];
                    }

                    if (req.body.hasOwnProperty('startingBid')) {
                        starting_bid = req.body['startingBid'];
                    } else {
                        starting_bid = result['listing_startingprice'];
                    }

                    let listing = {
                        "category_id": category_id,
                        "title": title,
                        "reserve_price": reserve_price,
                        "start_date_time": start_date_time,
                        "end_date_time": end_date_time,
                        "description": description,
                        "starting_bid": starting_bid
                    };

                    listings.alter(listing_id, listing, function (err) {
                        if (err) {
                            console.log(listing);
                            console.log(err)
                            return res.sendStatus(500);
                        }

                        console.log('Update listing: invalid end date');
                        console.log(listing);

                        return res.sendStatus(201);
                    })

                }
            }
        });
    });
}

/**
 * Get a photo for a listing
 */
exports.list_photos = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    // Check file exists
    let check_path_jpeg = app_dir + "/uploads/" + listing_id + ".jpeg"
    let check_path_png = app_dir + "/uploads/" + listing_id + ".png"

    let default_path = app_dir + "/uploads/default.png"

    fs.stat(check_path_jpeg, function (err, stat) {
        if (err) {
            fs.stat(check_path_png, function (err, stat) {
                if (err) {
                    // Not found JPEG or PNG
                    fs.stat(default_path, function (err, stat) {
                        if (err) {
                            // There is a problem
                            res.sendStatus(500);
                        } else {
                            // Send the default
                            res.set("Content-Type", 'image/png');
                            res.status(200);
                            res.sendFile(default_path);
                        }
                    });
                } else {
                    // Its found a png
                    res.set("Content-Type", 'image/png');
                    res.status(200);
                    res.sendFile(check_path_png);
                }
            });
        } else {
            // Its found a JPEG
            res.set("Content-Type", 'image/jpeg');
            res.sendFile(check_path_jpeg);

        }
    });
}

/**
 * Post a photo for a listing
 */
exports.add_photo = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    let token = req.get(config.get('authToken'));
    users.getIdFromToken(token, function (err, _id) {
        listings.getOne(listing_id, function (err, results) {
            if (err) {
                log.warn(`listings.controller.add_photo: model returned err: ${err}`);
                return res.sendStatus(500);
            } else if (!results) {
                return res.sendStatus(404);
            } else if (results[0]['listing_startingdate'] <= (new Date).getTime()) {
                log.warn(`listings.controller.add_photo: cant update after start date`);
                return res.sendStatus(400);
            } else {
                let result = results[0];
                let owner_id = result['listing_userid']

                if (_id !== owner_id) {
                    return res.sendStatus(403);
                } else {
                    let content_type = req.get('Content-Type');
                    console.log('Content-Type=', content_type);
                    if (!content_type) {
                        console.log(req)
                    }
                    ;

                    let file_ext = "";
                    if (content_type === 'image/png') {
                        file_ext = "png";
                    } else if (content_type === 'image/jpeg' || content_type === 'image/jpg') {
                        file_ext = "jpeg";
                    }
                    if (file_ext === '') {
                        console.log('file_ext is empty')
                    }
                    ;
                    console.log('add_photo:', listing_id + file_ext, 'user_id', owner_id);

                    let check_path_jpeg = "./uploads/" + listing_id + ".jpeg"
                    let check_path_png = "./uploads/" + listing_id + ".png"

                    try {
                        fs.unlink(check_path_jpeg, function (err) {
                            if (err) {
                                fs.unlink(check_path_png, function (err) {
                                    if (err) {
                                        log.warn(`listings.controller.add_photo: unlinking existing file returned: ${err}`);
                                    }

                                    req.pipe(fs.createWriteStream('./uploads/' + listing_id + '.' + file_ext));
                                    res.sendStatus(201);

                                });
                            } else {
                                req.pipe(fs.createWriteStream('./uploads/' + listing_id + '.' + file_ext));
                                res.sendStatus(201);
                            }
                        });
                    } catch (e) {
                        console.log("error posting image")
                        console.log(e);
                    }


                }
            }
        });
    });
}

/**
 * Delete a listings photo
 */
exports.delete_photo = function (req, res) {
    let listing_id = parseInt(req.params.id);
    if (!validator.isValidId(listing_id)) return res.sendStatus(404);

    let token = req.get(config.get('authToken'));
    users.getIdFromToken(token, function (err, _id) {
        listings.getOne(listing_id, function (err, results) {
            if (err) {
                log.warn(`listings.controller.get_one: model returned err: ${err}`);
                return res.sendStatus(500);
            } else if (!results || results.length == 0) {
                return res.sendStatus(404);
            } else {
                let result = results[0];
                log.warn(result);
                let owner_id = result['listing_userid']

                if (_id !== owner_id) {
                    return res.sendStatus(403);
                } else {
                    let check_path_jpeg = "./uploads/" + listing_id + ".jpeg"
                    let check_path_png = "./uploads/" + listing_id + ".png"

                    fs.unlink(check_path_jpeg, function (err) {
                        if (err) {
                            fs.unlink(check_path_png, function (err) {
                                if (err) {
                                    log.warn(`listings.controller.delete_photo: unlinking file returned: ${err}`);
                                    res.sendStatus(500);
                                } else {
                                    res.sendStatus(201);
                                }
                            });
                        } else {
                            res.sendStatus(201)
                        }
                    });
                }
            }
        });
    });
}

/**
 Get all categories
 */
exports.get_categories = function (req, res) {
    console.log("getting categories...");
    listings.getCategories(function (err, results) {
        if (err) {
            log.warn(`listings.controller.get_categories: model returned error: ${err}`);
            return res.sendStatus(500);
        } else {
            return res.status(200).json(results);
        }
    });
}

/**
 Get listings that the logged in user has won
 */
exports.get_won_listings = function (req, res) {
    let token = req.get(config.get('authToken'));
    users.getIdFromToken(token, function (err, user_id) {
        if (err) {
            log.warn(`listings.controller.get_won_listings: couldn't get id from token: ${err}`);
            return res.sendStatus(400);
        } else {

            listings.getWonListings(user_id, function (err, results) {
                if (err || !results) {
                    return res.sendStatus(400);
                }

                if (results.length == 0) {
                    return res.status(200).json(results);
                } else {
                    if (!validator.isValidSchema(results, 'components.schemas.listingsOverview')) {
                        log.warn(JSON.stringify(results, null, 2));
                        log.warn(validator.getLastErrors());
                        return res.sendStatus(500);
                    } else {
                        return res.status(200).json(results);
                    }
                }
            })


        }
    });
}
