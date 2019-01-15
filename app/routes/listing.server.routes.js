const listing = require('../controllers/listing.server.controllers'),
    auth = require('../lib/middleware');

module.exports = function (app) {
    app.route('/api/v1/listings')
        .get(listing.list)
        .post(auth.isAuthenticated, listing.create);

    app.route('/api/v1/listings/:id')
        .get(listing.get_one)
        .patch(auth.isAuthenticated, listing.update);

    app.route('/api/v1/my_won_auctions/')
        .get(auth.isAuthenticated, listing.get_won_listings);

    app.route('/api/v1/listings/:id/bids')
        .get(listing.get_bids)
        .post(auth.isAuthenticated, listing.add_bid);

    app.route('/api/v1/categories')
        .get(listing.get_categories);

    app.route('/api/v1/regions')
        .get(listing.get_regions);

    app.route('/api/v1/listings/:id/photos')
        .get(listing.list_photos)
        .post(auth.isAuthenticated, listing.add_photo)
        .delete(auth.isAuthenticated, listing.delete_photo);

}
