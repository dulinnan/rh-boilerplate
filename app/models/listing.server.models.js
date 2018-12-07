const db = require('../../config/db');
const dateTime = require('node-datetime');
const dateFormat = require('dateformat');

/**
 * return all projects between `limit` and `limit+offset` when ordered by creation timestamp
 *
 */
const getAll = function (searchParams, done) {
    let sql = `SELECT listing.listing_id AS id, listing.listing_location AS location, region.region_id AS regionCode, ` +
        `region.region_title AS region, listing.listing_description AS description, listing.listing_reserveprice AS reservePrice ` +
        ` FROM listing JOIN category ON listing.listing_categoryid = category.category_id ` +
        ` LEFT OUTER JOIN region ON region.region_id = listing.listing_regionid ` +
        ` WHERE listing.listing_creationdate >= CURRENT_TIMESTAMP() `;
    if (searchParams['q']) {
        sql += ` AND listing.listing_location LIKE '%${searchParams['q']}%'`
    }
    if (searchParams['category-id']) {
        sql += ` AND category.category_id = ${searchParams['category-id']}`;
    }
    if (searchParams['host']) {
        sql += ` AND listing.listing_contactid = ${searchParams['host']}`;
    }
    let status = searchParams["status"];
    if (status && status !== "" && status !== "all") {
        if (status == "upcoming") {
            sql += ` AND listing.listing_startingdate > CURRENT_TIMESTAMP()`;
        }
        if (status == "active") {
            sql += ` AND listing.listing_startingdate <= CURRENT_TIMESTAMP() AND listing.listing_endingdate > CURRENT_TIMESTAMP()`;
        }
        if (status == "expired") {
            sql += ` AND listing.listing_endingdate <= CURRENT_TIMESTAMP() AND (bid.bid_amount < listing.listing_reserveprice OR bid.bid_amount IS NULL)`;
        }
        if (status == "won") {
            sql += ` AND listing.listing_endingdate <= CURRENT_TIMESTAMP() AND bid.bid_amount >= listing.listing_reserveprice`;
        }
    }
    sql += ` ORDER BY regionCode ASC, id ASC `;
    if (searchParams['count']) {
        sql += ` LIMIT ${searchParams['count']}`;
    }
    if (searchParams['startIndex']) {
        if (searchParams['count']) {
            sql += ` OFFSET ${searchParams['startIndex']}`;
        } else {
            sql += ` LIMIT 18446744073709551615 OFFSET ${searchParams['startIndex']}`; //This random big number is from the official solution from the mySQL team for using an offset when no limit is provided
        }
    }
    db.get_pool().query(sql, function (err, results) {
        if (err) return done(err, false);
        for (i = 0; i < results.length; i++) {

            if (results[i].reservePrice == null) {
                results[i].reservePrice = 0;
            }
            //
            // delete results[i].startingPrice;
            //
            // results[i].startDateTime = Date.parse(results[i].startDateTime);
            // results[i].endDateTime = Date.parse(results[i].endDateTime);
        }
        return done(false, results);
    });
}


/**
 * insert listing
 */
const insert = function (listing, user_id, done) {

    let startDateTime = new Date(parseInt(listing.startDateTime));
    let endDateTime = new Date(parseInt(listing.endDateTime));

    //let creation_date = dateTime.create().format('Y-m-d H:M:S');
    // let creation_date = dateFormat((new Date).getTime(), "yyyy-mm-dd h:MM:ss");
    // let start_date = dateFormat(startDateTime, "yyyy-mm-dd h:MM:ss");
    // let end_date = dateFormat(endDateTime, "yyyy-mm-dd h:MM:ss");

    let creation_date = new Date(parseInt((new Date).getTime()));
    /*
    let creation_date = new Date((new Date).getTime());
    let start_date = new Date(startDateTime);
    let end_date = new Date(endDateTime);
    */

    console.log("***********");
    console.log('creating listing creation_date=', creation_date);
    console.log("***********");

    let values = [[listing.categoryId, listing.title, listing.description, creation_date, startDateTime, endDateTime, listing.reservePrice, listing.startingBid, user_id]];

    db.get_pool().query(
        'INSERT INTO listing (listing_categoryid, listing_title, listing_description, listing_creationdate, listing_startingdate, listing_endingdate, listing_reserveprice, listing_startingprice, listing_userid) VALUES (?)',
        values,
        function (err, results) {
            if (err) return done(err);

            return done(err, results.insertId)
        }
    );
}

/**
 * Return all bids for an listing
 */
const get_bids = function (id, done) {
    let query = 'SELECT bid.bid_amount AS amount, bid.bid_datetime AS datetime, bid.bid_userid AS buyerId, listing_user.user_username AS buyerUsername FROM bid, listing_user WHERE bid.bid_userid = listing_user.user_id AND bid.bid_listingid = ?';
    db.get_pool().query(
        query,
        [id],
        function (err, bids) {

            if (err) return done(err);
            if (bids.length == 0) return done(err, []);

            let format_bids = [];

            for (let item of bids) {
                //console.log(item);
                format_bids.push({
                    "amount": item['amount'],
                    "datetime": Date.parse(item['datetime']),
                    "buyerId": item['buyerId'],
                    "buyerUsername": item["buyerUsername"]
                });
            }

            return done(err, format_bids);
        }
    )
}


/**
 * Add a bid to an listing
 */
const add_bid = function (listing_id, user_id, amount, done) {
    let creation_date = dateTime.create().format('Y-m-d H:M:S');

    let values = [[user_id, listing_id, amount, creation_date]];

    db.get_pool().query(
        'INSERT INTO bid (bid_userid, bid_listingid, bid_amount, bid_datetime) VALUES (?)',
        values,
        function (err, results) {
            if (err) return done(err);

            return done(err, results.insertId)
        }
    );

}


/**
 * Get a single listing
 */
const get_one = function (listing_id, done) {

    let values = [[listing_id]];

    let query = 'SELECT listing.listing_categoryid, category.category_title, listing.listing_title, listing.listing_reserveprice, listing.listing_startingdate, listing.listing_endingdate, listing.listing_description, listing.listing_creationdate, listing.listing_userid, listing_user.user_username, listing.listing_startingprice FROM listing, category, listing_user WHERE listing.listing_categoryid = category.category_id AND listing.listing_userid = listing_user.user_id AND listing.listing_id = ?';

    db.get_pool().query(
        query,
        values,
        function (err, results) {
            if (err) {
                return done(err, false);
            } else {
                if (results.length === 0) {
                    return done(false, false);
                } else {
                    console.log("ending date from DB", results[0]['listing_endingdate']);
                    return done(false, results);
                }
            }
        }
    )

}

/**
 * update listing
 *
 */
const alter = function (id, listing, done) {

    console.log(listing);

    let query_string = 'UPDATE listing SET listing_categoryid=?, listing_title=?, listing_reserveprice=?, listing_startingdate=?, listing_endingdate=?, listing_description=?, listing_startingprice=? WHERE listing_id=?';
    let values = [
        listing.category_id,
        listing.title,
        listing.reserve_price,
        new Date(parseInt(listing.start_date_time)),
        new Date(parseInt(listing.end_date_time)),
        listing.description,
        listing.starting_bid,
        id
    ];

    db.get_pool().query(query_string,
        values,
        function (err, results) {
            done(err);
        }
    );
};

/**
 * Get all categories
 */
const get_categories = function (done) {
    db.get_pool().query(
        'SELECT category_id AS categoryId, category_title AS categoryTitle, category_description AS categoryDescription FROM category',
        function (err, results) {
            if (err) {
                return done(err, false);
            } else {
                return done(false, results)
            }
        }
    );
};

/**
 Get won listings
 */
const get_won_listings = function (user_id, done) {
    let sql = "SELECT listing.listing_id AS id, \
            category.category_title AS categoryTitle, \
            category.category_id AS categoryId,\
            listing.listing_title AS title, \
            listing.listing_reserveprice AS reservePrice, \
            listing.listing_startingdate AS startDateTime,\
            listing.listing_endingdate AS endDateTime, \
            bid.bid_amount AS currentBid, \
            listing.listing_startingprice AS startingPrice \
            FROM listing, bid, category \
            WHERE listing.listing_id = bid.bid_listingid \
            AND listing.listing_categoryid = category.category_id \
            AND bid.bid_userid = " + user_id + "\
            AND listing.listing_endingdate < CURRENT_TIMESTAMP \
            AND bid.bid_amount = (SELECT MAX(bid.bid_amount) FROM bid WHERE bid.bid_listingid = listing.listing_id) \
            AND bid.bid_amount >= listing.listing_reserveprice";
    db.get_pool().query(
        sql,
        function (err, results) {
            if (err) {
                return done(err, false);
            } else {

                for (i = 0; i < results.length; i++) {

                    if (results[i].currentBid == null) {
                        results[i].currentBid = results[i].startingPrice;
                    }

                    delete results[i].startingPrice;

                    results[i].startDateTime = Date.parse(results[i].startDateTime);
                    results[i].endDateTime = Date.parse(results[i].endDateTime);
                }


                return done(false, results)
            }
        }
    );

}

module.exports = {
    getAll: getAll,
    insert: insert,
    getBids: get_bids,
    addBid: add_bid,
    getOne: get_one,
    alter: alter,
    getCategories: get_categories,
    getWonListings: get_won_listings
}
